#  Segundo Proyecto Integrador 🚀

## ¿Por que estoy leyendo esto?
Si estas leyendo este README.md es porque un alumno le compartió desde GITHUB un [Archivo en formato .ZIP con el contenido del proyecto integrador](https://github.com/ClaudioPiazze/Proyecto_Integrador_2). 

En el marco de la cursada de la [Diplomatura en Programación WEB Backend](http://cuch.gob.ar/desarrollador-web-full-stack/), 
dictada en modalidad Virtual y Presencial por la [Uiversidad Nacional de 3 de Fefrero (UNTREF)](https://www.untref.edu.ar/) se presenta el segundo trabajo integrador correspondente a lo aprendido en lo que va del segundo cuatrimestre de 2023, donde se deberás desarrollar una aplicación integrando al proyecto Node.js Express, Sequelize y MySQL.

## Objetivo
El _objetivo de este desarrollo_ es demostrar a través de un trabajo integrador los diferentes temas aprendidos y tener la experiencia de poder desarrollar forma individual para llegar al objetivo propuesto por la cátedra.

## JSON elejido para poblar la Base de Datos : 

| Archivo | Descripción |
|--------------|--------------|
| TrailerFlix.json  | 🎦 Catalogo de Péliculas y Series   |
	

## Receta:
Para poder hacer funcionar al proyecto debera realizar los siguiente _pasos_:

### - Desde cero
1. Crear cluster.
2. Mongodb compass --> Subir el json y armar la bbdd.
3. VSCode --> Crear un proyecto.

### - Cuando descomprimis el archivo del proyecto .ZIP
Por linea de comandos realizar los siguientes pasos:
1. terminal --> **npm** init -y.
2. terminal --> **npm** install express 
3. terminal --> **npm** install mongodb
4. terminal --> **npm** install dotenv

### - Para cuando inicias el proyecto
1. Pegar esta linea en el package.json   "start": "node --watch server.js"
2. Crear las apis
3. Probar en postman o thunder cada API

### - Para cuando vas a ejectuar el server.js

1. Buscar la creación de la constante 'mibd' en la linea 7 del archivo 'server.js' y cambiar su contenido por el nombre de su base de datos
2. En la linea 8 del mismo archivo esta la declaración de la constante 'micoll' la que debera ser modificada con el nombre que le asignara a su coleccion

## ¿Quienes son los integrantes del grupo 3?

| Apellido y Nombre  |
|--------------|
| - [Ardura, Gabriela ](https://github.com/Gabi2277)|
| - [Lamenza, Gabriel ](https://github.com/GaOsLa)  |
| - [Piazze, Claudio ](https://github.com/ClaudioPiazze/)|
_Link GitHub_

## Canal Discord del Grupo 3️⃣
En este **[canal](https://discord.com/channels/1125929860309713000/1126640148684230798)** compartimos las dudas, afianzamos las soluciones, nos repatimos tareas, consolidamos acuerdos. Con mucha concentración, risas y desenfados. Conteniendonos mutuamente y llegando al objetivo! :smiley:

## ¿Como se compone la Creación, Lectura, Actualizacion y Borrado de uno o varias prendas? 🩳
Leer el siguiente apartado: [CRUD y Control De Errores](./CRUD_ControlDeErrores.md)  
