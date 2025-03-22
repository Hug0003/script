import xml.etree.ElementTree as ET
import pandas as pd
import os

# Obtenir le chemin du répertoire courant
current_dir = os.path.dirname(os.path.abspath(__file__))
xml_file = os.path.join(current_dir, 'etudiants.xml')

def ajouter_etudiant(nom, prenom, age, note_math, note_physique):
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
    
    physique_elem = ET.SubElement(notes_elem, 'matiere')
    physique_elem.set('nom', 'physique')
    physique_elem.text = str(note_physique)
    
    # Ajouter le nouvel étudiant à la racine
    root.append(nouvel_etudiant)
    
    # Sauvegarder les modifications
    tree.write(xml_file, encoding='utf-8', xml_declaration=True)
    print(f"\nÉtudiant {prenom} {nom} ajouté avec succès!")

def modifier_note(nom, prenom, matiere, nouvelle_note):
    # Parser le fichier XML
    tree = ET.parse(xml_file)
    root = tree.getroot()
    
    # Trouver l'étudiant
    for etudiant in root.findall('etudiant'):
        if (etudiant.find('nom').text == nom and 
            etudiant.find('prenom').text == prenom):
            # Trouver et modifier la note
            notes = etudiant.find('notes')
            matiere_elem = notes.find(f"matiere[@nom='{matiere}']")
            if matiere_elem is not None:
                matiere_elem.text = str(nouvelle_note)
                tree.write(xml_file, encoding='utf-8', xml_declaration=True)
                print(f"\nNote de {matiere} modifiée pour {prenom} {nom}")
                return True
    print(f"\nÉtudiant {prenom} {nom} non trouvé")
    return False

# Exemple d'utilisation
print("Ajout d'un nouvel étudiant...")
ajouter_etudiant("Garcia", "Carlos", 21, 16, 17)

print("\nModification d'une note...")
modifier_note("Dupont", "Marie", "math", 19)

# Afficher les données mises à jour
print("\nContenu mis à jour du fichier XML :")
tree = ET.parse(xml_file)
root = tree.getroot()

# Créer des listes pour stocker les données
noms = []
prenoms = []
ages = []
notes_math = []
notes_physique = []

# Extraire les données
for etudiant in root.findall('etudiant'):
    noms.append(etudiant.find('nom').text)
    prenoms.append(etudiant.find('prenom').text)
    ages.append(int(etudiant.find('age').text))
    
    # Récupérer les notes
    notes = etudiant.find('notes')
    notes_math.append(float(notes.find("matiere[@nom='math']").text))
    notes_physique.append(float(notes.find("matiere[@nom='physique']").text))

# Créer un DataFrame
df = pd.DataFrame({
    'nom': noms,
    'prenom': prenoms,
    'age': ages,
    'note_math': notes_math,
    'note_physique': notes_physique
})

print(df)

# Afficher quelques statistiques
print("\nStatistiques :")
print(f"Nombre total d'étudiants : {len(df)}")
print(f"\nMoyenne des notes de mathématiques : {df['note_math'].mean():.2f}")
print(f"Moyenne des notes de physique : {df['note_physique'].mean():.2f}")

# Afficher les étudiants ayant une note supérieure à 17 en mathématiques
print("\nÉtudiants ayant une note supérieure à 17 en mathématiques :")
print(df[df['note_math'] > 17])
