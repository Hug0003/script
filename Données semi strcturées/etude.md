# Étude comparative des formats semi-structurés

## Introduction
Les formats semi-structurés sont des formats de données qui, contrairement aux données structurées (comme les bases de données relationnelles), ne suivent pas un schéma strict et prédefini. Ils offrent plus de flexibilité tout en maintenant une certaine organisation.

## Formats étudiés

### 1. JSON (JavaScript Object Notation)
- **Origine** : Créé en 2001 par Douglas Crockford
- **Historique** : Initialement développé pour le langage JavaScript, il est devenu un standard indépendant
- **Caractéristiques** :
  * Format texte lisible par l'homme
  * Structure hiérarchique basée sur des paires clé-valeur
  * Support natif dans la plupart des langages de programmation
  * Très populaire pour les API REST
- **Avantages** :
  * Léger et compact
  * Facile à parser
  * Excellent support dans les langages modernes
- **Inconvénients** :
  * Pas de support des commentaires
  * Pas de support des références cycliques

### 2. CSV (Comma-Separated Values)
- **Origine** : Format très ancien, utilisé depuis les débuts de l'informatique
- **Historique** : Standardisé en 2005 (RFC 4180)
- **Caractéristiques** :
  * Format tabulaire simple
  * Séparation par délimiteurs (virgule, point-virgule, tabulation)
  * Première ligne souvent utilisée pour les en-têtes
- **Avantages** :
  * Très simple à lire et à écrire
  * Parfait pour les données tabulaires
  * Compatible avec Excel et autres outils bureautiques
- **Inconvénients** :
  * Pas de support des structures complexes
  * Problèmes avec les caractères spéciaux et les délimiteurs dans les données

### 3. YAML (YAML Ain't Markup Language)
- **Origine** : Créé en 2001 par Clark Evans, Ingy döt Net, et Oren Ben-Kiki
- **Historique** : Développé pour être plus lisible que XML
- **Caractéristiques** :
  * Format basé sur l'indentation
  * Support des commentaires
  * Support des références
- **Avantages** :
  * Très lisible par l'homme
  * Support des structures complexes
  * Idéal pour les fichiers de configuration
- **Inconvénients** :
  * Sensible à l'indentation
  * Peut être ambigu dans certains cas
  * Parsing plus complexe que JSON

### 4. XML (eXtensible Markup Language)
- **Origine** : Créé en 1996 par le W3C
- **Historique** : Successeur du SGML, standardisé en 1998
- **Caractéristiques** :
  * Format basé sur des balises
  * Support des schémas (DTD, XSD)
  * Structure hiérarchique stricte
- **Avantages** :
  * Très robuste et mature
  * Excellent support des métadonnées
  * Validation possible via schémas
- **Inconvénients** :
  * Verbose et lourd
  * Complexe à parser
  * Moins populaire pour les API modernes

## Comparaison générale

### Utilisation typique
- **JSON** : APIs web, échange de données entre services
- **CSV** : Données tabulaires, import/export de tableurs
- **YAML** : Fichiers de configuration, documentation
- **XML** : Documents structurés, échange de données entre systèmes d'entreprise

### Performance
- **CSV** > **JSON** > **YAML** > **XML** (en termes de taille et vitesse de parsing)

### Flexibilité
- **YAML** > **JSON** > **XML** > **CSV** (en termes de structures de données supportées)

## Conclusion
Chaque format a ses points forts et ses cas d'utilisation spécifiques. Le choix dépendra des besoins :
- Pour des données simples et tabulaires : CSV
- Pour des APIs web et échanges de données : JSON
- Pour des configurations et documentations : YAML
- Pour des documents complexes et structurés : XML

## Bibliothèques Python Utilisées

### Bibliothèques Standards
- **os** :
  * Utilisée dans tous les scripts
  * Gestion des chemins de fichiers
  * Accès au système de fichiers
  * Exemple : `os.path.dirname(os.path.abspath(__file__))`

### Bibliothèques Tierces
- **pandas** :
  * Utilisée pour la manipulation des données tabulaires
  * Conversion des données en DataFrame
  * Calcul de statistiques (moyennes)
  * Export vers CSV
  * Exemple : `df = pd.DataFrame(etudiants_data)`

- **json** :
  * Bibliothèque standard pour le format JSON
  * Parsing et sérialisation des données
  * Gestion des erreurs de format
  * Exemple : `json.load(fichier)`

- **yaml** :
  * Bibliothèque pour le format YAML
  * Parsing et sérialisation des données
  * Support des caractères Unicode
  * Exemple : `yaml.safe_load(f)`

- **xml.etree.ElementTree** :
  * Bibliothèque standard pour XML
  * Création et manipulation d'arbres XML
  * Parsing et sérialisation
  * Exemple : `ET.parse(xml_file)`

### Fonctionnalités Communes Implémentées
- Gestion des fichiers :
  * Lecture et écriture avec gestion des erreurs
  * Support de l'encodage UTF-8
  * Vérification de l'existence des fichiers

- Manipulation des données :
  * Conversion entre différents formats
  * Validation des données
  * Calcul de statistiques

- Interface utilisateur :
  * Affichage formaté des données
  * Messages d'erreur explicites
  * Confirmation des opérations


