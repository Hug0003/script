import sqlite3

connexion = sqlite3.connect('bdd.db')
curseur = connexion.cursor()