# Quotes

# Introduction
Cette application propose une collection de citations que l'utilisateur peut afficher et ajouter à ses favoris. L'application permet également de modifier les citations existantes et d'ajouter de nouvelles.

## Sources des images
En ce qui concerne les images utilisées dans l'application, il y a une seule image qui est le logo de l'application, mais avec quelques modifications : [Logo](https://www.pinterest.com/pin/505388389405560967/).  
La police utilisée est "Cairo" : [Cairo Font](https://fonts.google.com/specimen/Cairo).

Les icônes utilisées dans l'application sont spécifiques à Flutter.

## À propos de la source de données
Dans cette application, vous pouvez travailler soit avec une API, soit en inscrivant les données directement dans le fichier `lib/constants/quotes_data.dart`.

Les données des citations doivent contenir les informations suivantes :

- `id`: Identifiant unique pour chaque citation. Assurez-vous que chaque citation ait un identifiant distinct.
- `quote`: Le texte de la citation.
- `author`: L'auteur de la citation (ou la source de la citation).
- `color_id`: Correspond au couleur de la citation. Il s'agit d'un nombre, et vous pouvez changer les couleurs dans la variable `bgs` située dans le fichier `lib/constants/theme.dart`.

## Configuration de l'application
Avant de commencer à modifier l'application, il est nécessaire de la configurer correctement. Vous devez installer l'environnement de développement Flutter et vous assurer que toutes les bibliothèques et dépendances requises sont installées. Vous devrez également configurer les sources de données et prévoir un serveur API pour stocker les citations.

## Modification de l'application
L'application peut être modifiée en ajustant les couleurs, les polices et les icônes utilisées.

- Vous pouvez changer la police utilisée en sauvegardant le fichier de police souhaité dans le dossier `assets` sous le nom `font.ttf`.
- Vous pouvez remplacer ou ajouter des images dans le dossier `assets`.
- Vous pouvez modifier les couleurs dans le fichier `lib/constants/theme.dart`, spécifiquement dans la variable nommée `theme`.
- Vous pouvez également modifier les textes des citations en mettant à jour les données dans le fichier `quotes_data.dart`.

## Rôles des fichiers
Pour modifier l'application, il est nécessaire de modifier les fichiers dans le dossier `lib`. Voici un aperçu des rôles de chaque dossier et fichier.

Il est recommandé de parcourir les fichiers pour avoir une meilleure idée de la façon dont l'application peut être modifiée.

### Dossier `constants`
Contient les fichiers relatifs à la personnalisation des couleurs, textes et polices de l'application.

- `numbers`: Permet de modifier les paramètres suivants : la durée d'affichage de la page d'attente (en secondes) et les dimensions des images.
- `quotes_data`: Contient les données des citations (si vous ne souhaitez pas utiliser une API).
- `texts`: Contient les chemins des images et les textes spécifiques à l'application.
- `theme`: Permet de modifier les couleurs comme l'arrière-plan de la citation, la taille des polices, etc.

### Dossier `screens`
Vous trouverez dans l'application cinq pages : page d'attente, page principale, page des favoris, page des citations et page "À propos". Toutefois, il y a seulement quatre fichiers dans ce dossier car la page principale et la page des favoris partagent la même interface.

- `about_us`: Fichier pour la page "À propos".
- `loading_page`: Fichier pour la page d'attente.
- `page`: Fichier pour les pages principale et favoris.
- `quote_page`: Fichier pour la page des citations.

### Dossier `widgets`
Ce dossier contient les petites interfaces de chaque page pour faciliter la modification de l'application. Chaque page possède un sous-dossier avec des fichiers pour les petites interfaces (widgets).
