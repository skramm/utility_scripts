# gitclone: manuel

- S. Kramm - 20240923
- https://github.com/skramm/utility_scripts/

## Objectif
Ce script va réaliser un clonage d'un ensemble de dépots Git ayant tous le même nom mais fait par des comptes différents (étudiants).

**Contexte**:
permettre d'avoir localement les travaux d'étudiants présent sur leur repo.
Il faut évidemment leur IMPOSER le nom du dépot, et qu'il soit en "public".
Pour leurs identifiant Github, ils sont par contre libres de choisir `Carotte23` ou `Superman56`.

Il faut avoir préalablement un fichier csv contenant leur identifiant Github ainsi que leur groupe (par exemple A, B, C, ...) et un identifiant permettant de les connecter avec leur nom.
Cette collecte peut se faire via un formulaire Moodle, ce qui donne automatiquement leur identifiant universitaire (qui est utilisé ici).

Ce fichier pourrait ressembler à ceci:
```
Martin;A;Superman22
Duschmoll;B;Excelsior
Torvalds;A;bestOS
...
```

## Utilisation
```
$ gitclone nomdepot inputfile [outputfolder]
```
- `nomdepot`: nom des dépots Github ou Gitlab
- `inputfile`: nom du fichier CSV d'entrée contenant les identifiants Github ainsi que les noms ou identifiants universitaires
- `outputfolder`: nom du dossier de sortie.
Peut être absent, les clones seront créés dans le dossier courant.

Ceci va créer dans le dossier `outputfolder` un dossier `github_AAAAMMJJ_HHMM` contenant un dossier par groupe, et dans lequel on retrouvera les clones des dépots.


Les index donnant le numéro de colonne dans le fichier CSV d'entrée sont paramétrable via un fichier `gitlone.conf` à placer dans le dossier courant.
S'il est absent, des valeurs par défaut sont utilisées, voir les variables
`col_groupe`, `col_idgithub`,`col_idurn`.

Un fichier log `log_clonage_AAAAMMJJ_HHMM.csv` est automatiquement crée dans le dossier courant, et permet de logger les erreurs.


# Notes:

Ce script utilise le protocole "git".
Il faut donc:

- avoir un compte Github ou Gitlab
- avoir préalablement configuré la connection à Github en SSH
(création des clés SSH en local et copie de la clé publique sur son profil Github/Gitlab).


