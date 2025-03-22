import os

file_name = "endorahWeb.log"

# Liste de toutes les initialisations
initializations = {}

# Liste de toutes les pages avec le contenue charger tel que les images, les scripts, les styles, etc.
pages = {}


def get_content():
    """
    Fonction pour lire le contenu du fichier de log
    Retourne le contenu du fichier ou None en cas d'erreur
    """
    # Obtenir le répertoire du script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    log_file = os.path.join(script_dir, file_name)
    
    print(f"Recherche du fichier : {log_file}")
    
    try:
        with open(log_file, "r", encoding='utf-8') as fichier:
            contenu = fichier.read()
            return contenu
    except FileNotFoundError:
        print(f"Le fichier {log_file} n'a pas été trouvé")
        print("Veuillez vérifier que le fichier existe dans le répertoire :", script_dir)
    except Exception as e:
        print(f"Une erreur s'est produite lors de la lecture du fichier: {e}")




def traitement_content_initialization(content):
    """
    Fonction pour traiter les lignes d'initialisation du fichier de log
    Stocke les informations d'initialisation dans le dictionnaire initializations
    """
    if not content:
        print("Aucun contenu à traiter")
        return
    # Diviser le contenu en lignes
    lines = content.split('\n')
    
    for line in lines:
        section_lignes = line.split(" - ")

        for i in section_lignes:
            # Vérifier si la ligne contient une initialisation
            if "initialized" in line:
                # Extraction des informations de la ligne
                date = section_lignes[0]
                type_log = section_lignes[1]

                # Traitement des informations d'initialisation
                info_init = section_lignes[2]
                liste_info_init = info_init.split(" ")
                success = liste_info_init[-1]
                page = liste_info_init[:-2]

                # Stockage des informations dans le dictionnaire
                initializations[page[0]] = {
                    "date": date,
                    "type_log": type_log,
                    "success": success
                }
                
                # Affichage des initialisations traitées
                for k,v in initializations.items():
                    print(k,v)
                


def traitement_content_pages(content):
    """
    Fonction pour traiter les informations sur les pages chargées
    Stocke les détails des pages et leurs ressources dans le dictionnaire pages
    """
    # Variables pour stocker les informations temporaires
    nom_page = ""
    element_charge = ""
    protocole = ""
    
    if not content:
        print("Aucun contenu à traiter")
        return
        
    # Diviser le contenu en lignes
    lines = content.split('\n')

    for line in lines:
        section_lignes = line.split(" - ")

        for i in section_lignes:
            # Vérifier si la ligne se termine par un tiret
            if line[-1] == "-":
                # Extraction des informations de base
                date = section_lignes[0]
                type_log = section_lignes[1]
                ip = section_lignes[2]

                # Traitement des informations de la page
                info_page = section_lignes[3]
                section_info_page = info_page.split(' ')
                type_requet = section_info_page[3]

                # Traitement des requêtes réussies (code 200)
                if "200" in line:
                    section_info_page_200 = info_page.split(' ')
                    page_chargee = section_info_page_200[4]
                    # Extraction du nom de la page depuis l'URL
                    if page_chargee.count('/') >= 2:
                        debut = page_chargee.find('/')
                        fin = page_chargee.find('/', debut + 1)
                        nom_page = page_chargee[debut:fin]
                    else:
                        nom_page = page_chargee

                # Traitement des requêtes non réussies
                if "200" not in line:
                    section_info_page_not_200 = info_page.split(' ')
                    element_charge = section_info_page_not_200[4]
                    protocole = section_info_page_not_200[5]

                # Stockage des informations dans le dictionnaire
                pages[nom_page] = {
                    "date": date,
                    "type_log": type_log,
                    "ip": ip,
                    "type_requet": type_requet,
                    "element_charge": element_charge,
                    "protocole": protocole
                }
        
        # Affichage des pages traitées
        for k,v in pages.items():
            print(k,v)
            print()


# Appel de la fonction de traitement 
content = get_content()



print("-------------------------------- Début initialisation -------------------------------")
traitement_content_initialization(content)
print("-------------------------------- Fin initialisation -------------------------------")



print("-------------------------------- Début infos pages -------------------------------")
traitement_content_pages(content)
print("-------------------------------- Fin infos pages -------------------------------")
