import os
import re

errors = []
plugins_loads = []
map_loads = []
player_join_leaves = []
player_execute_commands = []
 
class error():
    @staticmethod
    def init():
        errors.clear()
        content = get_content()
        lines = content.split("\n")
        error_message = []
        time = None
        plugin = None
        current_error = None

        for line in lines:
            if current_error:
                if line.startswith("[") and get_date(line):
                    current_error = error(time, plugin, error_message)
                    current_error.message = "\n".join(error_message)
                    errors.append(current_error)
                    error_message = []
                    current_error = None
                    continue
                
                # Tant qu'on a une erreur en cours, on ajoute les lignes suivantes
                error_message.append(line)
                
            if is_error(line):
                if current_error:  # Si une erreur précédente était en cours, on l'ajoute
                    errors.append(current_error)
                
                time = get_date(line)
                plugin = get_plugin(line)
                error_message = [line] 
                
                current_error = error(time, plugin, error_message)
                
            
            
        if current_error:
            errors.append(current_error)  # Ajout de la dernière erreur trouvée
                
    def __init__(self, time, plugin, message_lines):
        self.time = time
        self.plugin = plugin
        self.message = "\n".join(message_lines)  # On stocke toute l'erreur sous forme de texte
        
    def __str__(self):
        return f"{self.time} - {self.plugin} - {self.message}"

    
class plugins_load():
    @staticmethod
    def init():
        plugins_loads.clear()
        content = get_content()
        lines = content.split("\n")
        for line in lines:
            if is_plugin_load(line):
                time = get_date(line)
                plugin = get_plugin_name(line)
                version = get_plugin_version(line)
                plugins_loads.append(plugins_load(time, plugin, version))
    def __init__(self, time, plugin, version):
        self.time = time
        self.plugin = plugin
        self.version = version
        
    def __str__(self):
        return f"{self.time} - {self.plugin} - {self.version}"
    

class map_load():
    @staticmethod
    def init():
        map_loads.clear()
        content = get_content()
        lines = content.split("\n")
        for line in lines:
            if is_map_load(line):
                time = get_date(line)
                map_name = get_map_name(line)
                map_loads.append(map_load(time, map_name))
    def __init__(self, time, map_name):
        self.time = time
        self.map_name = map_name
        
    def __str__(self):
        return f"{self.time} - {self.map_name}"
    
class player_join_leave():
    @staticmethod
    def init():
        player_join_leaves.clear()
        content = get_content()
        lines = content.split("\n")
        for line in lines:
            if is_player_join(line):
                time_join = get_date(line)
                player_name = get_player_join(line)
                ip = get_player_ip(line)
                player_join_leaves.append(player_join_leave(time_join, None, player_name, ip))
                
            if is_player_leave(line):
                time_leave = get_date(line)
                player_name = get_player_leave(line)
                p = player_join_leave.get_player_join(player_name)
                if p:
                    p.time_leave = time_leave
                else:
                    print(f"Impossible de trouver le joueur {player_name} dans la liste des connexions")
                
    @staticmethod
    def get_player_join(player_name):
        for p in player_join_leaves:
            if p.player_name == player_name and p.time_leave == None:
                return p
        return None
    def __init__(self, time_join, time_leave, player_name, ip):
        self.time_join = time_join
        self.time_leave = time_leave
        self.player_name = player_name
        self.ip = ip
        
    def __str__(self):
        return f"{self.time_join} - {self.time_leave} - {self.player_name} - {self.ip}"
    
    
class player_execute_command():
    @staticmethod
    def init():
        player_execute_commands.clear()
        content = get_content()
        lines = content.split("\n")
        for line in lines:
            if is_player_execute_command(line):
                time = get_date(line)
                player_name = get_player_of_command(line)
                command = get_command(line)
                player_execute_commands.append(player_execute_command(time, player_name, command))
    def __init__(self, time, player_name, command):
        self.time = time
        self.player_name = player_name
        self.command = command
        
    def __str__(self):
        return f"{self.time} - {self.player_name} - {self.command}"

def is_player_execute_command(input_text):
    pattern = re.compile(r"\[\d{2}:\d{2}:\d{2}\] \[Server thread/INFO\]: ([^ ]+) issued server command: (/.+)", re.IGNORECASE)
    return bool(pattern.search(input_text))

def get_player_of_command(input_text):
    pattern = re.compile(r"\[\d{2}:\d{2}:\d{2}\] \[Server thread/INFO\]: ([^ ]+) issued server command: (/.+)", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group(1)
    return None

def get_command(input_text):
    pattern = re.compile(r"\[\d{2}:\d{2}:\d{2}\] \[Server thread/INFO\]: ([^ ]+) issued server command: (/.+)", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group(2)
    return None







file_name = "minecraft.log"




def get_content():
    # Obtenir le répertoire du script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    log_file = os.path.join(script_dir, file_name)
    
    
    try:
        with open(log_file, "r", encoding='utf-8') as fichier:
            contenu = fichier.read()
            return contenu
    except FileNotFoundError:
        print(f"Le fichier {log_file} n'a pas été trouvé")
        print("Veuillez vérifier que le fichier existe dans le répertoire :", script_dir)
    except Exception as e:
        print(f"Une erreur s'est produite lors de la lecture du fichier: {e}")

def get_date(input_text):
    pattern = re.compile(r"\[[0-9]{2}:[0-9]{2}:[0-9]{2}(\.[0-9]{1,3})?\]", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group()
    return None

def get_plugin(input_text):
    pattern = re.compile(r"'([^']*)'", re.IGNORECASE)
    match = pattern.search(input_text)  
    if match:
        return match.group(1)  
    return "Unknown"

def is_error(input_text):
    pattern = re.compile(r"\[ServerMain/ERROR\]", re.IGNORECASE)
    return bool(pattern.search(input_text))

def is_plugin_load(input_text):
    pattern = re.compile(r"Loading server plugin", re.IGNORECASE)
    return bool(pattern.search(input_text))

def get_plugin_name(input_text):
    pattern = re.compile(r"\[\w+\] Loading server plugin (\w+)", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group(1)
    return None

def get_plugin_version(input_text):
    pattern = re.compile(r"Loading server plugin \w+ v([\d.]+(?:-[\w\d]+)?)", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group(1)
    return None

def is_map_load(input_text):
    pattern = re.compile(r"World Settings For \[([^\]]+)\]", re.IGNORECASE)
    return bool(pattern.search(input_text))

def get_map_name(input_text):
    pattern = re.compile(r"World Settings For \[([^\]]+)\]", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group(1)


def is_player_join(input_text):
    pattern = re.compile(r"\[\d{2}:\d{2}:\d{2}\] \[Server thread/INFO\]: .* logged in with entity id", re.IGNORECASE)
    return bool(pattern.search(input_text))

def get_player_join(input_text):
    pattern = re.compile(r"\]: ([^/\[]+)\[/", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group(1)
    return None

def get_player_ip(input_text):
    pattern = re.compile(r"/(\d+\.\d+\.\d+\.\d+):\d+", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group(1)
    return None

def is_player_leave(input_text):
    pattern = re.compile(r"\[\d{2}:\d{2}:\d{2}\] \[Server thread/INFO\]: .* lost connection:", re.IGNORECASE)
    return bool(pattern.search(input_text))

def get_player_leave(input_text):
    pattern = re.compile(r"\]: ([^ ]+) lost connection:", re.IGNORECASE)
    match = pattern.search(input_text)
    if match:
        return match.group(1)
    return None

error.init()

plugins_load.init()

map_load.init()

player_join_leave.init()

player_execute_command.init()


def exploit():
    # Afficher les statistiques sur les erreurs
    print("\n=== Statistiques des erreurs ===")
    print(f"Nombre total d'erreurs: {len(errors)}")
    
    # Compter les erreurs par plugin
    plugins_errors = {}
    for err in errors:
        if err.plugin not in plugins_errors:
            plugins_errors[err.plugin] = 0
        plugins_errors[err.plugin] += 1
    
    print("\nErreurs par plugin:")
    for plugin, count in plugins_errors.items():
        print(f"- {plugin}: {count} erreurs")

    # Statistiques sur les plugins chargés
    print("\n=== Statistiques des plugins ===") 
    print(f"Nombre de plugins chargés: {len(plugins_loads)}")

    # Statistiques sur les mondes
    print("\n=== Statistiques des mondes ===")
    print(f"Nombre de mondes chargés: {len(map_loads)}")
    print("\nListe des mondes:")
    for world in map_loads:
        print(f"- {world}")

    # Statistiques sur les joueurs
    print("\n=== Statistiques des joueurs ===")
    players = set()
    for join in player_join_leaves:
        if hasattr(join, 'player') and join.player:
            players.add(join.player)
            
    print(f"Nombre de connexions/déconnexions: {len(player_join_leaves)}")
    print(f"Nombre de commandes exécutées: {len(player_execute_commands)}")

exploit()