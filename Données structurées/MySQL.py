import sqlite3

# Remplacer la connexion MySQL par une connexion SQLite
connexion = sqlite3.connect('Données structurées/database.sqlite')
curseur = connexion.cursor()