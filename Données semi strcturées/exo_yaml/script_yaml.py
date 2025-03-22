import yaml
import os
import pandas as pd

# Obtenir le chemin du répertoire courant
current_dir = os.path.dirname(os.path.abspath(__file__))
yaml_file = os.path.join(current_dir, 'etudiants.yaml')

def reinitialiser_fichier():
    # Créer la structure de données initiale
    data = {
        'etudiants': [
            {
                'nom': 'Meuriel',
                'prenom': 'Hugo',
                'age': 18,
                'notes': {
                    'math': 20,
                    'base_de_donnees': 20
                }
            },
            {
                'nom': 'Bruel',
                'prenom': 'Mathis',
                'age': 18,
                'notes': {
                    'math': 0,
                    'base_de_donnees': 0
                }
            }
        ]
    }
    
    # Sauvegarder dans le fichier YAML
    with open(yaml_file, 'w', encoding='utf-8') as f:
        yaml.dump(data, f, allow_unicode=True, sort_keys=False)
    print("\nFichier réinitialisé avec succès!")

def etudiant_existe(nom, prenom):
    # Lire le fichier YAML
    with open(yaml_file, 'r', encoding='utf-8') as f:
        data = yaml.safe_load(f)
    
    # Vérifier si l'étudiant existe déjà
    return any(etudiant['nom'] == nom and etudiant['prenom'] == prenom 
              for etudiant in data['etudiants'])

def ajouter_etudiant(nom, prenom, age, note_math, note_donnees):
    # Vérifier si l'étudiant existe déjà
    if etudiant_existe(nom, prenom):
        print(f"\nL'étudiant {prenom} {nom} existe déjà!")
        return
    
    # Lire le fichier YAML
    with open(yaml_file, 'r', encoding='utf-8') as f:
        data = yaml.safe_load(f)
    
    # Ajouter le nouvel étudiant
    nouveau_etudiant = {
        'nom': nom,
        'prenom': prenom,
        'age': age,
        'notes': {
            'math': note_math,
            'base_de_donnees': note_donnees
        }
    }
    
    data['etudiants'].append(nouveau_etudiant)
    
    # Sauvegarder dans le fichier YAML
    with open(yaml_file, 'w', encoding='utf-8') as f:
        yaml.dump(data, f, allow_unicode=True, sort_keys=False)
    print(f"\nÉtudiant {prenom} {nom} ajouté avec succès!")

def afficher_etudiants():
    # Lire le fichier YAML
    with open(yaml_file, 'r', encoding='utf-8') as f:
        data = yaml.safe_load(f)
    
    # Convertir en DataFrame pour l'affichage
    etudiants_data = []
    for etudiant in data['etudiants']:
        etudiants_data.append({
            'nom': etudiant['nom'],
            'prenom': etudiant['prenom'],
            'age': etudiant['age'],
            'note_math': etudiant['notes']['math'],
            'note_donnees': etudiant['notes']['base_de_donnees']
        })
    
    df = pd.DataFrame(etudiants_data)
    
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
