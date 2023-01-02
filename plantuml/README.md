# Exemples des diagrammes UML avec PlantUML

[PLantUML](https://plantuml.com/fr/) est un utilitaire qui permet de créer des diagrammes et des visualisations à l'aide de texte et de code.

Il est très indiqué pour documenter un projet logiciel et maintenir sa documentation via un dépôt Git.

La transformation vers du PNG ou du SVG peut se faire avec [une ligne de commande avec docker](#génération).

## Syntaxe

`car.plantuml`:
```plantuml
@startuml car

class Car {
   serialNumber : Integer
   brand : String
   model : String
   manufacturingTime : Date
}

class Driver {
   driverLicenseNumber : Integer
   firstname : String
   lastname : String
}

Driver - Car : drives >
Car *- Wheel : have 4 >
Car -- Person : < owns

@enduml
```

![Car](./car.png)


`auth.plantuml`:
```plantuml
@startuml auth

Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response

Alice -> Bob: Another authentication Request
Alice <-- Bob: Another authentication Response

@enduml
```

![Auth](./auth.png)


## Editor

[Visual Studio extension](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml)

Live editor
* https://www.panjianning.com/puml
* https://github.com/panjianning/plantuml-live-editor

Choose SVG for export

## Generation with Docker 

```bash
docker run -t --rm  -v `pwd`:/var/docs plantuml/plantuml -h
FILES=$(for f in *.plantuml; do echo /var/docs/$f; done)
docker run -t --rm  -v `pwd`:/var/docs plantuml/plantuml -nbthread 8 -tsvg -o /var/docs $FILES
docker run -t --rm  -v `pwd`:/var/docs plantuml/plantuml -nbthread 8 -tpng -o /var/docs $FILES
```

## CI

[PlantUML and GitLab](https://docs.gitlab.com/ee/administration/integration/plantuml.html)

## Génération

### Génération d'un diagramme de classe en SVG

```bash
FILES=$(for f in *.plantuml; do echo /var/docs/$f; done)
docker run -t --rm  -v `pwd`:/var/docs plantuml/plantuml -nbthread 8 -tsvg -o /var/docs $FILES
```


## Génération d'un diagramme de classe en PNG
```bash
FILES=$(for f in *.plantuml; do echo /var/docs/$f; done)
docker run -t --rm  -v `pwd`:/var/docs plantuml/plantuml -nbthread 8 -tpng -o /var/docs $FILES
```

## Bonus
* [plantuml2mysql](https://github.com/grafov/plantuml2mysql)
* [sql2puml](https://github.com/bmrussell/sql2puml)

## Exemples

### Diagrammes de cas d'usage

![Cas d'usage](./usecase.png)

### Diagrammes d'objets

![object01](./object01.png)

### Diagrammes d'activités

![Activité](./activity01.png)
![Activité](./activity02.png)
![Activité](./activity03.png)

### Diagrammes d'état

![Etat](./state01.png)
![Etat](./state02.png)
![Etat](./state03.png)
![Etat](./state04.png)

### Diagrammes de composants

![Composant](./component.png)

### Diagrammes de déploiement

![déploiement](./deployment01.png)
![déploiement](./deployment02.png)

### Schéma SQL

![sql](./sql01.png)

### XEarth

![xearth](./xearth.png)
