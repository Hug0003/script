import pandas as pd
import os

# Obtenir le chemin du répertoire courant
current_dir = os.path.dirname(os.path.abspath(__file__))
csv_file = os.path.join(current_dir, 'etudiants.csv')

def reinitialiser_fichier():
    # Créer le DataFrame initial
    df = pd.DataFrame({
        'nom': ['Meuriel', 'Bruel'],
        'prenom': ['Hugo', 'Mathis'],
        'age': [18, 18],
        'note_math': [20, 0],
        'note_donnees': [20, 0]
    })
    
    # Sauvegarder dans le fichier CSV
    df.to_csv(csv_file, index=False)
    print("\nFichier réinitialisé avec succès!")

def etudiant_existe(nom, prenom):
    # Lire le fichier CSV
    df = pd.read_csv(csv_file)
    
    # Vérifier si l'étudiant existe déjà
    return not df[(df['nom'] == nom) & (df['prenom'] == prenom)].empty

def ajouter_etudiant(nom, prenom, age, note_math, note_donnees):
    # Vérifier si l'étudiant existe déjà
    if etudiant_existe(nom, prenom):
        print(f"\nL'étudiant {prenom} {nom} existe déjà!")
        return
    
    # Lire le fichier CSV
    df = pd.read_csv(csv_file)
    
    # Ajouter le nouvel étudiant
    nouveau_etudiant = pd.DataFrame({
        'nom': [nom],
        'prenom': [prenom],
        'age': [age],
        'note_math': [note_math],
        'note_donnees': [note_donnees]
    })
    
    # Concaténer avec le DataFrame existant
    df = pd.concat([df, nouveau_etudiant], ignore_index=True)
    
    # Sauvegarder dans le fichier CSV
    df.to_csv(csv_file, index=False)
    print(f"\nÉtudiant {prenom} {nom} ajouté avec succès!")

def afficher_etudiants():
    # Lire le fichier CSV
    df = pd.read_csv(csv_file)
    
    print("\nListe des étudiants :")
    print(df)
    
    # Afficher quelques statistiques
    print("\nStatistiques :")
    print(f"Nombre total d'étudiants : {len(df)}")
    print(f"Moyenne des notes de mathématiques : {df['note_math'].mean():.2f}")
    print(f"Moyenne des notes de base de données : {df['note_donnees'].mean():.2f}")

# Réinitialiser le fichier et afficher la liste
print("Réinitialisation du fichier...")
reinitialiser_fichier()

# Ajouter un nouvel étudiant
print("\nAjout d'un nouvel étudiant...")
ajouter_etudiant("Remi", "Durand", 19, -6, -6)

# Afficher la liste mise à jour
afficher_etudiants()
