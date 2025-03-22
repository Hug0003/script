import os
import json

file_name = "data.json"

def get_content():
    """
    Fonction pour lire le contenu du fichier JSON
    Retourne les données parsées ou None en cas d'erreur
    """
    # Obtenir le répertoire du script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    json_file = os.path.join(script_dir, file_name)
    
    print(f"Recherche du fichier : {json_file}")
    
    try:
        with open(json_file, "r", encoding='utf-8') as fichier:
            # Parser le JSON en structure de données Python
            donnees = json.load(fichier)
            return donnees
    except FileNotFoundError:
        print(f"Le fichier {json_file} n'a pas été trouvé")
        print("Veuillez vérifier que le fichier existe dans le répertoire :", script_dir)
    except json.JSONDecodeError:
        print(f"Le fichier {json_file} n'est pas un JSON valide")
    except Exception as e:
        print(f"Une erreur s'est produite lors de la lecture du fichier: {e}")

def ecrire_json(donnees):
    """
    Fonction pour écrire dans le fichier JSON
    """
    # Obtenir le répertoire du script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    json_file = os.path.join(script_dir, file_name)
    
    try:
        with open(json_file, "w", encoding='utf-8') as fichier:
            json.dump(donnees, fichier, indent=4, ensure_ascii=False)
        print("✅ Données écrites avec succès dans le fichier JSON")
    except Exception as e:
        print(f"❌ Erreur lors de l'écriture du fichier : {e}")

def ajouter_etudiant(donnees, nom, prenom, age, notes):
    """
    Fonction pour ajouter un nouvel étudiant
    """
    nouvel_etudiant = {
        "nom": nom,
        "prenom": prenom,
        "age": age,
        "notes": notes
    }
    donnees["etudiants"].append(nouvel_etudiant)
    return donnees

def ajouter_cours(donnees, nom_cours, professeur):
    """
    Fonction pour ajouter un nouveau cours
    """
    nouveau_cours = {
        "professeur": professeur
    }
    donnees["cours"][nom_cours] = nouveau_cours
    return donnees

def afficher_donnees(donnees):
    """
    Fonction pour afficher les données de manière formatée
    """
    if donnees:
        print("\n=== Données des étudiants ===")
        for etudiant in donnees["etudiants"]:
            print(f"\nÉtudiant : {etudiant['prenom']} {etudiant['nom']}")
            print(f"Âge : {etudiant['age']}")
            print(f"Notes : {etudiant['notes']}")
            print(f"Moyenne : {sum(etudiant['notes']) / len(etudiant['notes']):.2f}")
        
        print("\n=== Informations des cours ===")
        for cours, info in donnees["cours"].items():
            print(f"\nCours : {cours}")
            print(f"Professeur : {info['professeur']}")

# Lecture des données existantes
print("\n=== Lecture des données initiales ===")
donnees = get_content()

if donnees:
    # Affichage des données actuelles
    afficher_donnees(donnees)
    
    # Ajout d'un nouvel étudiant
    print("\n=== Ajout d'un nouvel étudiant ===")
    donnees = ajouter_etudiant(
        donnees,
        "Meuriel",
        "Hugo",
        18,
        [20,20,20]
    )

    # Ajout d'un nouveau cours
    print("\n=== Ajout d'un nouveau cours ===")
    donnees = ajouter_cours(
        donnees,
        "Réseau",
        "Mickael"
    )
    
    # Sauvegarde des modifications
    ecrire_json(donnees)
    
    # Vérification des modifications
    print("\n=== Vérification des modifications ===")
    donnees_modifiees = get_content()
    afficher_donnees(donnees_modifiees)

