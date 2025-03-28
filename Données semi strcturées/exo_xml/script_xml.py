import xml.etree.ElementTree as ET
import pandas as pd
import os

# Obtenir le chemin du répertoire courant
current_dir = os.path.dirname(os.path.abspath(__file__))
xml_file = os.path.join(current_dir, 'etudiants.xml')



def etudiant_existe(nom, prenom):
    # Parser le fichier XML
    tree = ET.parse(xml_file)
    root = tree.getroot()
    
    # Vérifier si l'étudiant existe déjà
    for etudiant in root.findall('etudiant'):
        if (etudiant.find('nom').text == nom and 
            etudiant.find('prenom').text == prenom):
            return True
    return False

def ajouter_etudiant(nom, prenom, age, note_math, note_donnees):
    # Vérifier si l'étudiant existe déjà
    if etudiant_existe(nom, prenom):
        print(f"\nL'étudiant {prenom} {nom} existe déjà!")
        return
    
    # Parser le fichier XML
    tree = ET.parse(xml_file)
    root = tree.getroot()
    
    # Créer un nouvel étudiant
    nouvel_etudiant = ET.Element('etudiant')
    
    # Ajouter les informations de base
    nom_elem = ET.SubElement(nouvel_etudiant, 'nom')
    nom_elem.text = nom
    
    prenom_elem = ET.SubElement(nouvel_etudiant, 'prenom')
    prenom_elem.text = prenom
    
    age_elem = ET.SubElement(nouvel_etudiant, 'age')
    age_elem.text = str(age)
    
    # Ajouter les notes
    notes_elem = ET.SubElement(nouvel_etudiant, 'notes')
    
    math_elem = ET.SubElement(notes_elem, 'matiere')
    math_elem.set('nom', 'math')
    math_elem.text = str(note_math)
    
    donnees_elem = ET.SubElement(notes_elem, 'matiere')
    donnees_elem.set('nom', 'base de données')
    donnees_elem.text = str(note_donnees)
    
    # Ajouter le nouvel étudiant à la racine
    root.append(nouvel_etudiant)
    
    # Sauvegarder les modifications
    tree.write(xml_file, encoding='utf-8', xml_declaration=True)
    print(f"\nÉtudiant {prenom} {nom} ajouté avec succès!")

def afficher_etudiants():
    # Parser le fichier XML
    tree = ET.parse(xml_file)
    root = tree.getroot()
    
    # Créer des listes pour stocker les données
    noms = []
    prenoms = []
    ages = []
    notes_math = []
    notes_donnees = []
    
    # Extraire les données
    for etudiant in root.findall('etudiant'):
        noms.append(etudiant.find('nom').text)
        prenoms.append(etudiant.find('prenom').text)
        ages.append(int(etudiant.find('age').text))
        
        # Récupérer les notes
        notes = etudiant.find('notes')
        notes_math.append(float(notes.find("matiere[@nom='math']").text))
        notes_donnees.append(float(notes.find("matiere[@nom='base de données']").text))
    
    # Créer un DataFrame
    df = pd.DataFrame({
        'nom': noms,
        'prenom': prenoms,
        'age': ages,
        'note_math': notes_math,
        'note_donnees': notes_donnees
    })
    
    print("\nListe des étudiants :")
    print(df)
    
    # Afficher quelques statistiques
    print("\nStatistiques :")
    print(f"Nombre total d'étudiants : {len(df)}")
    print(f"Moyenne des notes de mathématiques : {df['note_math'].mean():.2f}")
    print(f"Moyenne des notes de base de données : {df['note_donnees'].mean():.2f}")


# Ajouter un nouvel étudiant
print("\nAjout d'un nouvel étudiant...")
ajouter_etudiant("Remi", "Durand", 19, -6, -6)

# Afficher la liste mise à jour
afficher_etudiants()
