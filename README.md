#  Segundo Proyecto Integrador 🚀

## ¿Por que estoy leyendo esto?
Si estas leyendo este README.md es porque un alumno le compartió desde GITHUB un [Archivo en formato .ZIP con el contenido del proyecto integrador](https://github.com/ClaudioPiazze/Proyecto_Integrador_2). 

En el marco de la cursada de la [Diplomatura en Programación WEB Backend](http://cuch.gob.ar/desarrollador-web-full-stack/), 
dictada en modalidad Virtual y Presencial por la [Uiversidad Nacional de 3 de Fefrero (UNTREF)](https://www.untref.edu.ar/) se presenta el segundo trabajo integrador correspondente a lo aprendido en lo que va del segundo cuatrimestre de 2023, donde se deberás desarrollar una aplicación integrando al proyecto *Node.js* *Express*, *Sequelize* y *MySQL*.

## Objetivo
El _objetivo de este desarrollo_ es demostrar a través de un trabajo integrador los diferentes temas aprendidos y tener la experiencia de poder desarrollar forma individual para llegar al objetivo propuesto por la cátedra.

## JSON elejido para poblar la Base de Datos : 

| Archivo | Descripción |
|--------------|--------------|
| TrailerFlix.json  | 🎦 Catalogo de Péliculas y Series   |
	
## El proyecto debe incluir:
1. Desarrollo de una bb.dd MySQL con el modelo relacional aplicado de acuerdo a la información almacenada en trailerflix.json
   
	a. catalogos (almacenar datos de películas y series)
	b. categorias (serie, película, documental, etc...)
	c. actores (datos de actrices y actores reparto)
	d. genero (Acción, Drama, Terror, Comedia)
	e. N tablas intermedias (catalogo_reparto, catalogo_actrores)

### Se crear el modelo relacional de la bb.dd. y las diferentes tablas, y luego exportar el código a .SQL para poder crear la bb.dd., tablas y relaciones.



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

## ¿Quienes es el integrantes?

| Apellido y Nombre  |
|--------------|
| - [Piazze, Claudio ](https://github.com/ClaudioPiazze/)|
_Link GitHub_

## Canal Discord de la Diplomatura Chivilcoy Backend
En este **[canal](https://discord.com/channels/1041764377386287134/1096437854118359050)** compartimos las dudas, y material de la cursada :smiley:

## ¿Como se compone la Creación, Lectura, Actualizacion y Borrado de uno o varias prendas? 🩳
Leer el siguiente apartado: [CRUD y Control De Errores](./CRUD_ControlDeErrores.md)  
