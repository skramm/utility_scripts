# Script gitclone: manuel

S. Kramm - 20240923

## Objectif
Ce script va réaliser un clonage d'un ensemble de dépot Github ayant tous le même nom
mais fait par des comptes différents (étudiants).

Contexte: permettre d'avoir localement les travaux d'étudiants présent sur leur repo.
Il faut évidemment leur IMPOSER le nom du dépot, et qu'il soit en "public"

Il faut avoir préalablement un fichier csv contenant leur identifiant Github ainsi
que leur groupe et un identifiant permettant de les connecter avec leur nom.
Cette collecte peut se faire via un formulaire Moodle, ce qui donne automatiquement
leur identifiant universitaire (qui est utilisé ici).

## Utilisation
```
$ gitclone nomdepot inputfile outputfolder
```
- `nomdepot`: nom du dépot Github
- `inputfile`: nom du fichier CSV d'entrée contenant les id github ainsi que les identifiants
- `outputfolder`: nom du dossier de sortie (peut être `.` pour le dossier courant).

# Notes:

Ce script utilise le protocole "git".
Il faut donc:
- avoir un compte Github
- avoir préalablement configuré la connection à Github en SSH
(création des clés SSH en local et copie de la clé publique sur son profil Github).


