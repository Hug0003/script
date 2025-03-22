
import MySQL
################################################################
#                        SQL TABLES                            #
################################################################

"""
CREATE TABLE Navbar(
    id          Int NOT NULL AUTO_INCREMENT,
    label       Varchar (50) NOT NULL,
    position    Int NOT NULL,
    id_Navbar   Int NULL,
    redirection Varchar (255) NULL,
    CONSTRAINT Navbar_PK PRIMARY KEY (id)
)ENGINE=InnoDB;
"""

##############################################################################
#                               OBJECTS                                      #
##############################################################################

navbars = []
class Navbar:
    def __init__(self, id: int, label: str = None, position: int = None, id_Navbar: int = None, redirection: str = None):
        self.id = id
        self.label = label
        self._position = position
        self.id_Navbar = id_Navbar
        self.redirection = redirection

    @property
    def position(self):
        """Retourne la position brute stockée en base"""
        return self._position

    @position.setter
    def position(self, value):
        """Définit la position brute"""
        self._position = value

    @property
    def side(self):
        """Retourne le côté (1 pour gauche, 2 pour droite)"""
        if self._position is None:
            return None
        return 1 if self._position < 100 else 2

    @property
    def order(self):
        """Retourne l'ordre dans la liste"""
        if self._position is None:
            return None
        if self.id_Navbar is None:
            # Pour les parents, l'ordre est la position (1-99 pour gauche, 100+ pour droite)
            return self._position if self._position < 100 else self._position - 100
        else:
            # Pour les enfants, l'ordre est la position moins 1000
            return self._position - 1000

    def set_position(self, side: int, order: int, parent_id: int = None) -> int:
        """Calcule la position finale à partir du côté et de l'ordre"""
        if side not in [1, 2]:
            raise ValueError("Side must be 1 or 2")
        
        if parent_id is None:
            # Pour les parents
            if side == 1:
                # Menu gauche : positions 1-99
                return order
            else:
                # Menu droite : positions 100+
                return 100 + order
        else:
            # Pour les enfants, position = 1000 + order
            return 1000 + order

    def update_position(self, connexion, cursor, side: int, order: int = None, parent_id: int = None):
        """Met à jour la position en base en calculant la valeur finale"""
        if order is None:
            # Si l'ordre n'est pas spécifié, on garde l'ordre actuel
            order = self.order if self.order is not None else 0
        
        new_position = self.set_position(side, order, parent_id)
        connexion.ping(reconnect=True)
        request = "UPDATE Navbar SET position = %s WHERE id = %s"
        cursor.execute(request, (new_position, self.id))
        connexion.commit()
        self._position = new_position

    def initialize(self, connexion, cursor):
        connexion.ping(reconnect=True)
        request = "SELECT * FROM Navbar WHERE id = %s"
        cursor.execute(request, (self.id,))
        result = cursor.fetchone()
        self.label = result[1]
        self.position = result[2]
        self.id_Navbar = result[3]
        self.redirection = result[4]

    def update_label(self, connexion, cursor, label: str):
        connexion.ping(reconnect=True)
        request = "UPDATE Navbar SET label = %s WHERE id = %s"
        cursor.execute(request, (label, self.id))
        connexion.commit()
        self.label = label

    def update_id_Navbar(self, connexion, cursor, id_Navbar: int):
        connexion.ping(reconnect=True)
        request = "UPDATE Navbar SET id_Navbar = %s WHERE id = %s"
        cursor.execute(request, (id_Navbar, self.id))
        connexion.commit()
        self.id_Navbar = id_Navbar

    def update_redirection(self, connexion, cursor, redirection: str):
        connexion.ping(reconnect=True)
        request = "UPDATE Navbar SET redirection = %s WHERE id = %s"
        cursor.execute(request, (redirection, self.id))
        connexion.commit()
        self.redirection = redirection

    def delete(self, connexion, cursor):
        connexion.ping(reconnect=True)
        delete_request = "DELETE FROM Navbar WHERE id = %s"
        cursor.execute(delete_request, (self.id,))
        connexion.commit()
        navbars.remove(self)

    def has_children(self):
        for navbar in navbars:
            if navbar.id_Navbar == self.id:
                return True
        return False

###############################################################################
#                            GLOBAL FUNCTIONS                                 #
###############################################################################

def get_navbar(id_navbar) -> Navbar:
    for navbar in navbars:
        if str(navbar.id) == str(id_navbar):
            return navbar
    return None

def create_navbar(connexion, cursor, label: str, position: int, id_Navbar: int = None, redirection: str = None) -> Navbar:
    connexion.ping(reconnect=True)
    request = "INSERT INTO Navbar (label, position, id_Navbar, redirection) VALUES (%s, %s, %s, %s)"
    cursor.execute(request, (label, position, id_Navbar, redirection))
    connexion.commit()
    navbar = Navbar(cursor.lastrowid, label, position, id_Navbar, redirection)
    return navbar

def initialize_navbars(connexion, cursor):
    connexion.ping(reconnect=True)
    request = "SELECT id FROM Navbar ORDER BY id"
    cursor.execute(request)
    results = cursor.fetchall()
    for result in results:
        navbar = Navbar(result[0])
        navbar.initialize(connexion, cursor)
        navbars.append(navbar)
    return navbars

initialize_navbars(MySQL.connexion, MySQL.curseur)




def exploit():
    """Affiche des statistiques sur les éléments de navigation"""
    print("\n=== Statistiques de Navigation ===")
    print(f"Nombre total d'éléments: {len(navbars)}")
    
    # Compter les éléments par côté
    gauche = sum(1 for nav in navbars if nav.side == 1)
    droite = sum(1 for nav in navbars if nav.side == 2)
    print(f"Éléments à gauche: {gauche}")
    print(f"Éléments à droite: {droite}")
    
    # Compter les éléments parents/enfants
    parents = len([nav for nav in navbars if any(n.id_Navbar == nav.id for n in navbars)])
    enfants = sum(1 for nav in navbars if nav.id_Navbar is not None)
    print(f"Éléments parents: {parents}")
    print(f"Éléments enfants: {enfants}")
    
    # Compter les éléments avec redirection
    avec_redirection = len([nav for nav in navbars if nav.redirection and nav.redirection.strip()])
    print(f"Éléments avec redirection: {avec_redirection}")
    
exploit()







