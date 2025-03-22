import pandas as pd

# Lire le fichier CSV
data = pd.read_csv('data.csv')

# Afficher toutes les données
print("\n=== Liste des joueurs ===")
for index, row in data.iterrows():
    print(f"\nJoueur {index + 1}:")
    print(f"Nom: {row['nom']}")
    print(f"Âge: {row['age']}")
    print(f"Niveau: {row['niveau']}")
    print(f"Score: {row['score']}")

# Afficher les statistiques
print("\n=== Statistiques ===")
print(f"Nombre total de joueurs: {len(data)}")
print(f"Score moyen: {data['score'].mean():.2f}")
print(f"Âge moyen: {data['age'].mean():.2f}")
print(f"Niveau moyen: {data['niveau'].mean():.2f}")

# Trouver le meilleur joueur
meilleur_joueur = data.loc[data['score'].idxmax()]
print("\n=== Meilleur joueur ===")
print(f"Nom: {meilleur_joueur['nom']}")
print(f"Score: {meilleur_joueur['score']}")
print(f"Niveau: {meilleur_joueur['niveau']}")
