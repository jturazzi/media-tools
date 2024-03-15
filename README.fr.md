# Media Tools

Cette image Docker fournit un ensemble d'outils pour la conversion et le traitement des médias, visant à résoudre les problèmes de stockage liés aux images et aux vidéos.

## Outils inclus

- ffmpeg : Un outil puissant de traitement vidéo et audio.
- jpegoptim : Un utilitaire pour l'optimisation des images JPEG.
- heif-convert : Un outil pour convertir les images HEIF en JPEG.

## Problématique

Les images et vidéos non optimisées occupent souvent un espace considérable sur le stockage. Les formats de fichiers comme HEIC pour les images et MOV pour les vidéos peuvent également présenter des problèmes de compatibilité avec certaines plateformes.

## Fonctionnalités du script

Le script inclus dans cette image Docker offre les fonctionnalités suivantes :

- **Compression JPEG :** Le script utilise `jpegoptim` pour compresser les images JPEG afin de réduire leur taille tout en préservant leur qualité.
- **Conversion HEIC en JPEG :** Les images HEIC sont converties en images JPEG à l'aide de l'outil `heif-convert`, ce qui permet de les rendre compatibles avec une plus grande variété de plates-formes et d'applications.
- **Compression ou Conversion de Vidéos :** Les vidéos au format MOV ou MP4 sont compressées ou converties en vidéos au format MP4 à l'aide de `ffmpeg`. Cette opération réduit la taille des fichiers vidéo tout en maintenant une qualité acceptable pour la visualisation et le partage.

## Utilisation

Pour utiliser cette image Docker, vous devez spécifier un dossier d'entrée contenant les médias à traiter et un dossier de sortie où seront stockés les médias traités.

### Docker run
```bash
docker run --rm -v /path/to/media/in:/media/in -v /path/to/media/out:/media/out jturazzi/media-tools:latest
```

### Docker compose
```yml
version: '3.8'
services:
  app:
    image: jturazzi/media-tools:latest
    container_name: media-tools
    volumes:
      - /path/to/media/in:/media/in
      - /path/to/media/out:/media/out
```

## Construction de l'image

Pour construire l'image Docker, vous pouvez utiliser la commande suivante :
```bash
docker build -t nom_de_votre_image .
```

Assurez-vous de vous placer dans le répertoire contenant le Dockerfile avant d'exécuter cette commande.

## Licence

Ce projet est sous licence MIT.