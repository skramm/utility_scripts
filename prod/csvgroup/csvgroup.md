# csvgroup (nom provisoire)

## OBJECTIF:

Soit n étudiants qui déposent sur Moodle un fichier CSV dont le gabarit leur a été donné et qui contient leur réponses
à des questions

Par exemple, Alice va restituer un fichier comme ceci:
```
Q1;rep A
Q2;rep B
Q3;rep C
```
Un autre étudiant "Bob" va fournir un autre fichier:
```
Q1;rep X
Q2;rep Y
Q3;rep Z
```

L'objectif est d'arriver à un fichier CSV résultat contenant en lignes les noms des étudiants et en colonne les question et leur réponses:

```
Question;Q1;Q2;Q3
Bob;rep A;rep B;rep C
Alice;rep X;rep Y;rep Z
```

Un tel fichier pourra facilement être importé dans un tableur (LO Calc ou Excel) pour évaluer leurs réponses question par question.

## Usage
```
$ ./csvgroup Moodle_exported_file.zip
```

