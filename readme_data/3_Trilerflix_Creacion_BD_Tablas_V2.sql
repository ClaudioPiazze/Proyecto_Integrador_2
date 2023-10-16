-------------------------------------
-- Creado por: Claudio_Piazze
-- Fecha: 10/10/2023
-- ----------------------------------
-- Creación de la BD 
-- ----------------------------------
DROP DATABASE IF EXISTS Trailerflix;
CREATE DATABASE Trailerflix
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE Trailerflix;

-- ----------------------
-- Creación de las Tablas
-- ----------------------

-- Crear la tabla de categorías
CREATE TABLE `categorias` (
	`id_categoria` int NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre` varchar(50) NOT NULL,
	PRIMARY KEY (`id_categoria`)
);

-- Crear la tabla de generos
CREATE TABLE `generos` (
	`id_genero` int NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre` varchar(25) NOT NULL,
	PRIMARY KEY (`id_genero`)
);

-- Crear la tabla de actrices y actores
CREATE TABLE `actores` (
	`id_actor` int NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre` varchar(100) NOT NULL,
	PRIMARY KEY (`id_actor`)
);

-- Crear la tabla de catalogos
CREATE TABLE `catalogos` (
	`id_catalogo` int NOT NULL AUTO_INCREMENT UNIQUE,
	`poster` varchar(255) NOT NULL,
	`titulo` varchar(255) NOT NULL,
	`categoria_id` int NOT NULL,
	`resumen` TEXT NOT NULL,
	`temporadas` int,
	`trailer` varchar(255) NOT NULL,
	PRIMARY KEY (`id_catalogo`)
);

CREATE TABLE `catalogos_generos` (
	`id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`catalogo_id` int NOT NULL,
	`genero_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `catalogos_actores` (
	`id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`catalogo_id` int NOT NULL,
	`actor_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

-- -------------------------------------------------------------------------------------------------------------------------------------------
--  CONSTRAINT FOREIGN KEY ayudan a establece una relación entre dos tablas, donde la columna con la restricción de clave foránea en una tabla 
--  debe coincidir con los valores en la columna clave principal de otra tabla. Ayuda a mantener la integridad referencial en la base de datos
-- -------------------------------------------------------------------------------------------------------------------------------------------.
ALTER TABLE `catalogos` ADD CONSTRAINT `catalogos_fk0` FOREIGN KEY (`categoria_id`) REFERENCES `categorias`(`id_categoria`);
ALTER TABLE `catalogos_actores` ADD CONSTRAINT `catalogos_actores_fk0` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogos`(`id_catalogo`);
ALTER TABLE `catalogos_actores` ADD CONSTRAINT `catalogos_actores_fk1` FOREIGN KEY (`actor_id`) REFERENCES `actores`(`id_actor`);
ALTER TABLE `catalogos_generos` ADD CONSTRAINT `catalogos_generos_fk0` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogos`(`id_catalogo`);
ALTER TABLE `catalogos_generos` ADD CONSTRAINT `catalogos_generos_fk1` FOREIGN KEY (`genero_id`) REFERENCES `generos`(`id_genero`);


-- --------------------------------
-- Insersion de datos en las Tablas
-- --------------------------------
--------------------------
-- Insertar las categorías
-- ----------------------- 
INSERT INTO categorias (nombre) VALUES
    ('Serie'),
    ('Película') ;

-- ---------------------------------------
-- Insertar datos en la tabla de catálogos
-- ---------------------------------------
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (3, '/posters/3.jpg',' The Mandalorian',1,'Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.', 2,'https://www.youtube.com/embed/aOC8E8z_ifw');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (4, '/posters/4.jpg',' The Umbrella Academy',1,'La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.', 1,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (5, '/posters/5.jpg',' Gambito de Dama',1,'En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.', 1,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (2, '/posters/2.jpg',' Riverdale',1,'El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.', 5,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (1, '/posters/1.jpg',' The Crown',1,'Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.', 4,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (6, '/posters/6.jpg',' Enola Holmes',2,'La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.', Null,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (7, '/posters/7.jpg',' Guasón',2,'Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.', Null,'https://www.youtube.com/embed/zAGVQLHvwOY');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (8, '/posters/8.jpg',' Avengers: End Game',2,'Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.', Null,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (9, '/posters/9.jpg',' Juego de tronos',1,'En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.', 8,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (10, '/posters/10.jpg',' The Flash',1,'Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.', 6,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (11, '/posters/11.jpg',' The Big Bang Theory',1,'Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.', 12,'https://www.youtube.com/embed/WBb3fojgW0Q');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (12, '/posters/12.jpg',' Friends',1,'"Friends" narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.', 10,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (13, '/posters/13.jpg',' Anne with an "E"',1,'Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.', 2,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (14, '/posters/14.jpg',' Expedientes Secretos "X"',1,'Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de "siniestro"', 11,'https://www.youtube.com/embed/KKziOmsJxzE');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (15, '/posters/15.jpg',' Chernobyl',1,'Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.', 1,'https://www.youtube.com/embed/s9APLXM9Ei8');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (16, '/posters/16.jpg',' Westworld',1,'"Westworld" es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.', 3,'https://www.youtube.com/embed/qLFBcdd6Qw0');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (17, '/posters/17.jpg',' Halt and Catch Fire',1,'Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. 
 Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).', 4,'https://www.youtube.com/embed/pWrioRji60A');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (18, '/posters/18.jpg',' Ava',2,'Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.', Null,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (19, '/posters/19.jpg',' Aves de presa y la fantabulosa emancipación de una Harley Quinn',2,'Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.', Null,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (20, '/posters/20.jpg',' Archivo',2,'2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.', Null,'https://www.youtube.com/embed/VHSoCnDioAo');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (21, '/posters/21.jpg',' Jumanji - The next level',2,'Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?', Null,'https://www.youtube.com/embed/rBxcF-r9Ibs');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (22, '/posters/22.jpg',' 3022',2,'La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.', Null,'https://www.youtube.com/embed/AGQ7OkmIx4Q');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (23, '/posters/23.jpg',' IT - Capítulo 2',2,'En este segundo capitulo Han pasado 27 años desde que el "Club de los Perdedores", formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.', Null,'https://www.youtube.com/embed/hZeFeYSmBcg');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (24, '/posters/24.jpg',' Pantera Negra',2,'T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.', Null,'https://www.youtube.com/embed/BE6inv8Xh4A');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (25, '/posters/25.jpg',' Contra lo imposible (Ford versus Ferrari)',2,'Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.', Null,'https://www.youtube.com/embed/SOVb0-2g1Q0');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (26, '/posters/26.jpg',' Centígrados',2,'Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.', Null,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (27, '/posters/27.jpg',' DOOM: Aniquilación',2,'Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.', Null,'https://www.youtube.com/embed/nat3u3gAVLE');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (28, '/posters/28.jpg',' Contagio',2,'De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.', Null,'https://www.youtube.com/embed/4sYSyuuLk5g');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (29, '/posters/29.jpg',' Viuda Negra',2,'Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.', Null,'https://www.youtube.com/embed/BIn8iANwEog');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (30, '/posters/30.jpg',' The Martian',2,'Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.', Null,'https://www.youtube.com/embed/XvB58bCVfng');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (31, '/posters/31.jpg',' Ex-Machina',2,'Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.', Null,'https://www.youtube.com/embed/XRYL5spvEcI');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (32, '/posters/32.jpg',' Jurassic World',2,'Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.', Null,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (33, '/posters/33.jpg',' Soy leyenda',2,'Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.', Null,'https://www.youtube.com/embed/dtKMEAXyPkg');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (34, '/posters/34.jpg',' El primer hombre en la luna',2,'Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.', Null,'');
INSERT INTO catalogos (id_catalogo, poster, titulo, categoria_id, resumen, temporadas, trailer)
VALUES (35, '/posters/35.jpg',' Titanes del pacífico - La insurrección',2,'Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.', Null,'');
-- -------------------------------------------------------------------------
-- Insertar los difertentes géneros de films que exitens en la tabla generos
-- ------------------------------------------------------------------------- 
INSERT INTO generos (nombre) VALUES ('Ciencia Ficción');
INSERT INTO generos (nombre) VALUES ('Fantasía');
INSERT INTO generos (nombre) VALUES ('Drama');
INSERT INTO generos (nombre) VALUES ('Ficción');
INSERT INTO generos (nombre) VALUES ('Sucesos');
INSERT INTO generos (nombre) VALUES ('Misterio');
INSERT INTO generos (nombre) VALUES ('Hechos verídicos');
INSERT INTO generos (nombre) VALUES ('Crimen');
INSERT INTO generos (nombre) VALUES ('Suspenso');
INSERT INTO generos (nombre) VALUES ('Aventura');
INSERT INTO generos (nombre) VALUES ('Acción');
INSERT INTO generos (nombre) VALUES ('Comedia');
INSERT INTO generos (nombre) VALUES ('Familia');
INSERT INTO generos (nombre) VALUES ('Western');
INSERT INTO generos (nombre) VALUES ('Tecnología');
INSERT INTO generos (nombre) VALUES ('Terror');
INSERT INTO generos (nombre) VALUES ('Historia');
INSERT INTO generos (nombre) VALUES ('Intriga');

-- ------------------------------------------------------------------------------------------------------------------
-- Insertar los datos que relacionan los códigos de catalogos con las códigos de la tabla generos "catalogos_generos"
-- ------------------------------------------------------------------------------------------------------------------
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (3, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (3, 2);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (4, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (4, 2);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (5, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (5, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (5, 5);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (2, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (2, 6);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (2, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (1, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (1, 7);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (6, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (6, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (6, 7);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (7, 8);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (7, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (7, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (8, 10);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (8, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (8, 11);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (9, 10);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (9, 2);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (9, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (10, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (10, 2);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (11, 12);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (11, 2);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (11, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (12, 12);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (12, 13);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (12, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (13, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (13, 13);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (13, 14);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (14, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (14, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (15, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (15, 7);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (16, 14);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (16, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (17, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (17, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (17, 15);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (18, 11);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (18, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (18, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (19, 11);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (19, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (19, 12);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (20, 11);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (20, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (20, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (21, 12);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (21, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (21, 10);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (22, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (22, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (23, 16);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (23, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (23, 2);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (24, 11);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (24, 10);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (24, 2);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (25, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (25, 17);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (25, 10);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (26, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (26, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (26, 18);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (27, 11);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (27, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (27, 16);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (28, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (28, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (28, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (29, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (29, 11);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (29, 10);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (30, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (30, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (30, 10);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (31, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (31, 1);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (31, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (32, 9);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (32, 10);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (32, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (33, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (33, 16);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (33, 4);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (34, 3);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (34, 7);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (35, 11);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (35, 2);
INSERT INTO catalogos_generos (catalogo_id,genero_id) VALUES (35, 1);

-- ----------------------------------------------------------------------------
-- Insertar los nombre y apellidos de la actrices y actores en la tabla Actores
-- ----------------------------------------------------------------------------
INSERT INTO actores (nombre) VALUES ('Adam Nagaitis');
INSERT INTO actores (nombre) VALUES ('Adeel Akhtar');
INSERT INTO actores (nombre) VALUES ('Aidan Gallagher');
INSERT INTO actores (nombre) VALUES ('Alana Cavanaugh');
INSERT INTO actores (nombre) VALUES ('Alice Braga');
INSERT INTO actores (nombre) VALUES ('Alicia Vikander');
INSERT INTO actores (nombre) VALUES ('Amy Manson');
INSERT INTO actores (nombre) VALUES ('Amybeth McNulty');
INSERT INTO actores (nombre) VALUES ('Angus Macfadyen');
INSERT INTO actores (nombre) VALUES ('Anya Taylor-Joy');
INSERT INTO actores (nombre) VALUES ('Awkwafina');
INSERT INTO actores (nombre) VALUES ('Benjamin Sokolow');
INSERT INTO actores (nombre) VALUES ('Bill Hader');
INSERT INTO actores (nombre) VALUES ('Bill Skarsgård');
INSERT INTO actores (nombre) VALUES ('Brett Cullen');
INSERT INTO actores (nombre) VALUES ('Bruce Harwood');
INSERT INTO actores (nombre) VALUES ('Bryce Dallas Howard');
INSERT INTO actores (nombre) VALUES ('Burn Gorman');
INSERT INTO actores (nombre) VALUES ('Cailee Spaeny');
INSERT INTO actores (nombre) VALUES ('Caitriona Balfe');
INSERT INTO actores (nombre) VALUES ('Camila Mendes');
INSERT INTO actores (nombre) VALUES ('Candice Patton');
INSERT INTO actores (nombre) VALUES ('Carl Weathers');
INSERT INTO actores (nombre) VALUES ('Carlos Valdes');
INSERT INTO actores (nombre) VALUES ('Casey Cott');
INSERT INTO actores (nombre) VALUES ('Chadwick Boseman');
INSERT INTO actores (nombre) VALUES ('Charlie Tahan');
INSERT INTO actores (nombre) VALUES ('Chloe Pirrie');
INSERT INTO actores (nombre) VALUES ('Chris Bartlett');
INSERT INTO actores (nombre) VALUES ('Chris Evans');
INSERT INTO actores (nombre) VALUES ('Chris Hemsworth');
INSERT INTO actores (nombre) VALUES ('Chris Messina');
INSERT INTO actores (nombre) VALUES ('Chris Pratt');
INSERT INTO actores (nombre) VALUES ('Christian Bale');
INSERT INTO actores (nombre) VALUES ('Claire Fox');
INSERT INTO actores (nombre) VALUES ('Claire Foy');
INSERT INTO actores (nombre) VALUES ('Claire Selby');
INSERT INTO actores (nombre) VALUES ('Colin Farrell');
INSERT INTO actores (nombre) VALUES ('Common');
INSERT INTO actores (nombre) VALUES ('Corey Johnson');
INSERT INTO actores (nombre) VALUES ('Corey Stoll');
INSERT INTO actores (nombre) VALUES ('Corrine Koslo');
INSERT INTO actores (nombre) VALUES ('Courteney Cox');
INSERT INTO actores (nombre) VALUES ('Dalila Bela');
INSERT INTO actores (nombre) VALUES ('Danai Gurira');
INSERT INTO actores (nombre) VALUES ('Daniel Kaluuya');
INSERT INTO actores (nombre) VALUES ('Danielle Panabaker');
INSERT INTO actores (nombre) VALUES ('Dash Mihok');
INSERT INTO actores (nombre) VALUES ('David Castañeda');
INSERT INTO actores (nombre) VALUES ('David Duchovny');
INSERT INTO actores (nombre) VALUES ('David Harbour');
INSERT INTO actores (nombre) VALUES ('David Schwimmer');
INSERT INTO actores (nombre) VALUES ('Domhnall Gleeson');
INSERT INTO actores (nombre) VALUES ('Dominic Mafham');
INSERT INTO actores (nombre) VALUES ('Dwayne Johnson');
INSERT INTO actores (nombre) VALUES ('Ed Harris');
INSERT INTO actores (nombre) VALUES ('Elliot Page');
INSERT INTO actores (nombre) VALUES ('Emilia Clarke');
INSERT INTO actores (nombre) VALUES ('Emily Bayiokos');
INSERT INTO actores (nombre) VALUES ('Emily Watson');
INSERT INTO actores (nombre) VALUES ('Emma Thompson');
INSERT INTO actores (nombre) VALUES ('Emmy Raver-Lampman');
INSERT INTO actores (nombre) VALUES ('Enver Gjokaj');
INSERT INTO actores (nombre) VALUES ('Evan Rachel Wood');
INSERT INTO actores (nombre) VALUES ('Ewan McGregor');
INSERT INTO actores (nombre) VALUES ('Florence Pugh');
INSERT INTO actores (nombre) VALUES ('Frances Conroy');
INSERT INTO actores (nombre) VALUES ('Gana Bayarsaikhan');
INSERT INTO actores (nombre) VALUES ('Geena Davis');
INSERT INTO actores (nombre) VALUES ('Geraldine James');
INSERT INTO actores (nombre) VALUES ('Giancarlo Esposito');
INSERT INTO actores (nombre) VALUES ('Gillian Anderson');
INSERT INTO actores (nombre) VALUES ('Grant Gustin');
INSERT INTO actores (nombre) VALUES ('Gwyneth Paltrow');
INSERT INTO actores (nombre) VALUES ('Génesis Rodríguez');
INSERT INTO actores (nombre) VALUES ('Harry Melling');
INSERT INTO actores (nombre) VALUES ('Helena Bonham Carter');
INSERT INTO actores (nombre) VALUES ('Henry Cavill');
INSERT INTO actores (nombre) VALUES ('Ioan Gruffudd');
INSERT INTO actores (nombre) VALUES ('Irrfan Khan');
INSERT INTO actores (nombre) VALUES ('Isaiah Mustafa');
INSERT INTO actores (nombre) VALUES ('Jack Black');
INSERT INTO actores (nombre) VALUES ('James McAvoy');
INSERT INTO actores (nombre) VALUES ('James Weber Brown');
INSERT INTO actores (nombre) VALUES ('Janina Elkin');
INSERT INTO actores (nombre) VALUES ('Jared Harris');
INSERT INTO actores (nombre) VALUES ('Jason Clarke');
INSERT INTO actores (nombre) VALUES ('Jay Ryan');
INSERT INTO actores (nombre) VALUES ('Jeff Daniels');
INSERT INTO actores (nombre) VALUES ('Jeffrey Wright');
INSERT INTO actores (nombre) VALUES ('Jennifer Aniston');
INSERT INTO actores (nombre) VALUES ('Jennifer Ehle');
INSERT INTO actores (nombre) VALUES ('Jeremy Renner');
INSERT INTO actores (nombre) VALUES ('Jesse L. Martin');
INSERT INTO actores (nombre) VALUES ('Jessica Chastain');
INSERT INTO actores (nombre) VALUES ('Jessie Buckley');
INSERT INTO actores (nombre) VALUES ('Jim Parsons');
INSERT INTO actores (nombre) VALUES ('Jing Tian');
INSERT INTO actores (nombre) VALUES ('Joaquin Phoenix');
INSERT INTO actores (nombre) VALUES ('John Boyega');
INSERT INTO actores (nombre) VALUES ('John Malkovich');
INSERT INTO actores (nombre) VALUES ('Johnny Galecki');
INSERT INTO actores (nombre) VALUES ('Jon Bernthal');
INSERT INTO actores (nombre) VALUES ('Jorja Fox');
INSERT INTO actores (nombre) VALUES ('Josh Lucas');
INSERT INTO actores (nombre) VALUES ('Jude Law');
INSERT INTO actores (nombre) VALUES ('Judy Greer');
INSERT INTO actores (nombre) VALUES ('Jurnee Smollett');
INSERT INTO actores (nombre) VALUES ('Kaley Cuoco');
INSERT INTO actores (nombre) VALUES ('Karen Gillan');
INSERT INTO actores (nombre) VALUES ('Kate Mara');
INSERT INTO actores (nombre) VALUES ('Kate Walsh');
INSERT INTO actores (nombre) VALUES ('Kate Winslet');
INSERT INTO actores (nombre) VALUES ('Kerry Bishé');
INSERT INTO actores (nombre) VALUES ('Kevin Hart');
INSERT INTO actores (nombre) VALUES ('Kit Harington');
INSERT INTO actores (nombre) VALUES ('Kristen Wiig');
INSERT INTO actores (nombre) VALUES ('Kunal Nayyar');
INSERT INTO actores (nombre) VALUES ('Kyle Chandler');
INSERT INTO actores (nombre) VALUES ('Laurence Fishburne');
INSERT INTO actores (nombre) VALUES ('Lee Pace');
INSERT INTO actores (nombre) VALUES ('Lena Headey');
INSERT INTO actores (nombre) VALUES ('Lia Williams');
INSERT INTO actores (nombre) VALUES ('Lili Reinhart');
INSERT INTO actores (nombre) VALUES ('Lisa Kudrow');
INSERT INTO actores (nombre) VALUES ('Lorina Kamburova');
INSERT INTO actores (nombre) VALUES ('Louis Partridge');
INSERT INTO actores (nombre) VALUES ('Lucas Jade Zumann');
INSERT INTO actores (nombre) VALUES ('Luke Allen-Gale');
INSERT INTO actores (nombre) VALUES ('Luke Hemsworth');
INSERT INTO actores (nombre) VALUES ('Lupita Nyongo');
INSERT INTO actores (nombre) VALUES ('Mackenzie Davis');
INSERT INTO actores (nombre) VALUES ('Madelaine Petsch');
INSERT INTO actores (nombre) VALUES ('Margot Robbie');
INSERT INTO actores (nombre) VALUES ('Marion Cotillard');
INSERT INTO actores (nombre) VALUES ('Marisol Nichols');
INSERT INTO actores (nombre) VALUES ('Mark Ruffalo');
INSERT INTO actores (nombre) VALUES ('Martin Freeman');
INSERT INTO actores (nombre) VALUES ('Mary Elizabeth Winstead');
INSERT INTO actores (nombre) VALUES ('Matt Damon');
INSERT INTO actores (nombre) VALUES ('Matt LeBlanc');
INSERT INTO actores (nombre) VALUES ('Matt Smith');
INSERT INTO actores (nombre) VALUES ('Matthew Perry');
INSERT INTO actores (nombre) VALUES ('Mayim Bialik');
INSERT INTO actores (nombre) VALUES ('Melissa Rauch');
INSERT INTO actores (nombre) VALUES ('Michael B. Jordan');
INSERT INTO actores (nombre) VALUES ('Michael Peña');
INSERT INTO actores (nombre) VALUES ('Millie Bobby Brown');
INSERT INTO actores (nombre) VALUES ('Miranda Cosgrove');
INSERT INTO actores (nombre) VALUES ('Misty Rosas');
INSERT INTO actores (nombre) VALUES ('Mitch Pileggi');
INSERT INTO actores (nombre) VALUES ('Moses Ingram');
INSERT INTO actores (nombre) VALUES ('Mädchen Amick');
INSERT INTO actores (nombre) VALUES ('Nick Jonas');
INSERT INTO actores (nombre) VALUES ('Nick Robinson');
INSERT INTO actores (nombre) VALUES ('Nikolaj Coster-Waldau');
INSERT INTO actores (nombre) VALUES ('Nina Bergman');
INSERT INTO actores (nombre) VALUES ('Noah Jupe');
INSERT INTO actores (nombre) VALUES ('O.T. Fagbenle');
INSERT INTO actores (nombre) VALUES ('Olivia Colman');
INSERT INTO actores (nombre) VALUES ('Omar Epps');
INSERT INTO actores (nombre) VALUES ('Omar Sy');
INSERT INTO actores (nombre) VALUES ('Oscar Isaac');
INSERT INTO actores (nombre) VALUES ('Patrick Fugit');
INSERT INTO actores (nombre) VALUES ('Paul Ritter');
INSERT INTO actores (nombre) VALUES ('Pedro Pascal');
INSERT INTO actores (nombre) VALUES ('Peter Dinklage');
INSERT INTO actores (nombre) VALUES ('Peter Ferdinando');
INSERT INTO actores (nombre) VALUES ('R. H. Thomson');
INSERT INTO actores (nombre) VALUES ('Rachel Weisz');
INSERT INTO actores (nombre) VALUES ('Ray Winstone');
INSERT INTO actores (nombre) VALUES ('Rhona Mitra');
INSERT INTO actores (nombre) VALUES ('Rinko Kikuchi');
INSERT INTO actores (nombre) VALUES ('Rio Hackford');
INSERT INTO actores (nombre) VALUES ('Robert De Niro');
INSERT INTO actores (nombre) VALUES ('Robert Downey Jr.');
INSERT INTO actores (nombre) VALUES ('Robert Patrick');
INSERT INTO actores (nombre) VALUES ('Robert Sheehan');
INSERT INTO actores (nombre) VALUES ('Rosie Perez');
INSERT INTO actores (nombre) VALUES ('Ryan Gosling');
INSERT INTO actores (nombre) VALUES ('Salli Richardson-Whitfield');
INSERT INTO actores (nombre) VALUES ('Sam Claflin');
INSERT INTO actores (nombre) VALUES ('Scarlett Johansson');
INSERT INTO actores (nombre) VALUES ('Scoot McNairy');
INSERT INTO actores (nombre) VALUES ('Scott Eastwood');
INSERT INTO actores (nombre) VALUES ('Sean Bean');
INSERT INTO actores (nombre) VALUES ('Shea Whigham');
INSERT INTO actores (nombre) VALUES ('Simon Helberg');
INSERT INTO actores (nombre) VALUES ('Sonoya Mizuno');
INSERT INTO actores (nombre) VALUES ('Sophie Turner');
INSERT INTO actores (nombre) VALUES ('Stacy Martin');
INSERT INTO actores (nombre) VALUES ('Stellan Skarsgård');
INSERT INTO actores (nombre) VALUES ('Tessa Thompson');
INSERT INTO actores (nombre) VALUES ('Thandie Newton');
INSERT INTO actores (nombre) VALUES ('Theo James');
INSERT INTO actores (nombre) VALUES ('Thomas Brodie-Sangster');
INSERT INTO actores (nombre) VALUES ('Tobias Menzies');
INSERT INTO actores (nombre) VALUES ('Toby Huss');
INSERT INTO actores (nombre) VALUES ('Toby Jones');
INSERT INTO actores (nombre) VALUES ('Tom Braidwood');
INSERT INTO actores (nombre) VALUES ('Tom Cavanagh');
INSERT INTO actores (nombre) VALUES ('Tom Hopper');
INSERT INTO actores (nombre) VALUES ('Vanesa Kirby');
INSERT INTO actores (nombre) VALUES ('Vincent D Onofrio');
INSERT INTO actores (nombre) VALUES ('Vincent Piazza');
INSERT INTO actores (nombre) VALUES ('Will Smith');
INSERT INTO actores (nombre) VALUES ('William Hurt');
INSERT INTO actores (nombre) VALUES ('Willow Smith');
INSERT INTO actores (nombre) VALUES ('Zazie Beetz');

-- -----------------------------------------------------------------------------------------------------------------------
-- Insertar los datos de la relacion catalogo con las actrices y actores een la tabla intermedia llamada catalogos_actores
-- -----------------------------------------------------------------------------------------------------------------------
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (15, 1);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (6, 2);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (4, 3);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (17, 4);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (33, 5);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (31, 6);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (27, 7);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (13, 8);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (22, 9);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (5, 10);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (21, 11);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (26, 12);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (23, 13);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (23, 14);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (7, 15);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (14, 16);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (32, 17);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (35, 18);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (35, 19);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (25, 20);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (2, 21);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (10, 22);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (3, 23);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (10, 24);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (2, 25);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (24, 26);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (33, 27);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (5, 28);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (3, 29);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (8, 30);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (8, 31);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (19, 32);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (32, 33);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (25, 34);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (1, 35);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (34, 35);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (31, 36);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (18, 37);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (18, 38);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (31, 39);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (34, 40);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (13, 41);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (12, 42);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (13, 43);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (24, 44);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (24, 45);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (10, 46);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (33, 47);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (4, 48);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (14, 49);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (29, 50);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (12, 51);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (31, 52);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (27, 53);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (21, 54);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (16, 55);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (4, 56);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (9, 57);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (26, 58);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (15, 59);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (33, 60);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (4, 61);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (22, 62);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (16, 63);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (19, 64);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (29, 65);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (7, 66);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (31, 67);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (18, 68);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (26, 69);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (13, 70);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (3, 71);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (14, 72);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (10, 73);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (28, 74);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (5, 75);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (1, 76);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (6, 76);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (6, 77);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (18, 78);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (32, 79);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (23, 80);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (21, 81);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (23, 82);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (27, 83);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (5, 84);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (15, 85);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (34, 86);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (23, 87);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (30, 88);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (16, 89);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (12, 90);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (28, 91);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (8, 92);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (10, 93);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (18, 94);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (23, 94);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (30, 94);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (15, 95);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (11, 96);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (35, 97);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (7, 98);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (35, 99);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (18, 100);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (11, 101);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (25, 102);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (22, 103);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (25, 104);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (28, 105);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (32, 106);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (19, 107);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (11, 108);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (21, 109);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (30, 110);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (22, 111);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (28, 112);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (17, 113);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (21, 114);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (9, 115);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (30, 116);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (11, 117);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (34, 118);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (28, 119);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (17, 120);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (9, 121);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (20, 122);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (2, 123);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (12, 124);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (27, 125);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (6, 126);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (13, 127);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (27, 128);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (16, 129);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (24, 130);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (17, 131);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (2, 132);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (2, 133);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (19, 134);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (28, 135);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (2, 136);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (8, 137);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (24, 138);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (19, 139);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (25, 140);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (28, 140);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (30, 140);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (12, 141);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (1, 142);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (12, 143);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (11, 144);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (11, 145);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (24, 146);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (30, 147);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (6, 148);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (22, 149);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (3, 150);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (14, 151);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (5, 152);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (21, 153);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (32, 154);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (9, 155);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (27, 156);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (25, 157);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (29, 158);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (1, 159);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (22, 160);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (32, 161);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (31, 162);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (34, 163);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (15, 164);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (3, 165);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (9, 166);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (20, 167);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (13, 168);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (29, 169);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (29, 170);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (20, 171);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (35, 172);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (3, 173);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (7, 174);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (8, 175);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (14, 176);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (4, 177);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (19, 178);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (34, 179);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (33, 180);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (6, 181);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (8, 182);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (29, 183);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (17, 184);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (35, 185);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (30, 186);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (7, 187);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (11, 188);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (31, 189);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (9, 190);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (20, 191);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (15, 192);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (16, 193);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (16, 194);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (20, 195);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (5, 196);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (1, 197);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (17, 198);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (20, 199);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (14, 200);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (10, 201);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (4, 202);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (1, 203);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (32, 204);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (26, 205);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (33, 206);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (29, 207);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (33, 208);
INSERT INTO catalogos_actores (catalogo_id,actor_id) VALUES (7, 209);

-- ------------------------------------------------------
-- Creación de la Vista: TrilerFlix (Producto cartesiano)
-- ------------------------------------------------------
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER 
VIEW `trailerflix`.`vista_trailerflix` AS
 SELECT  
	id_catalogo as id, 
	poster, 
	titulo, 
	categorias.nombre as categoria,       -- 'Categoria'
	trailerflix.generos.nombre as genero, -- 'Generos' 
   	resumen, 
	CASE WHEN temporadas is null THEN 'N/A'
		 ELSE temporadas
	END AS temporadas, 
    trailerflix.actores.nombre as reparto, -- 'Actores de Reparto' 
	trailer 
	-- Relación con Catalogo Categorias
	FROM trailerflix.catalogos
	INNER JOIN trailerflix.categorias 
		ON trailerflix.catalogos.categoria_id = trailerflix.categorias.id_categoria
	-- Relación  Catalogos_Generos
	INNER JOIN trailerflix.catalogos_generos 
		ON trailerflix.catalogos.id_catalogo = trailerflix.catalogos_generos.catalogo_id
	INNER JOIN trailerflix.generos 
		ON trailerflix.generos.id_genero = trailerflix.catalogos_generos.genero_id
	-- Relación  Catalogos_Actores
	INNER JOIN trailerflix.catalogos_actores 
		ON trailerflix.catalogos.id_catalogo = trailerflix.catalogos_actores.catalogo_id
	INNER JOIN trailerflix.actores 
		ON trailerflix.actores.id_actor = trailerflix.catalogos_actores.actor_id
	ORDER BY id -- Ordenado por id_catalogo de la tabla Catalogos
; 

-- --------------------------------------------------------------------------------
-- Visualización de la vista del archivo TrailerFliz.json como producto cartesiano.
-- --------------------------------------------------------------------------------
-- SELECT * FROM  trailerflix.vista_trailerflix;

-- ---------------------------------------------------------------------------------------------------------------
-- Creación de la Vista: vista_catalogos (Agrupa por id de catalogos, los generos, actores y actrices de reparto)
-- ---------------------------------------------------------------------------------------------------------------
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER 
VIEW `trailerflix`.`vista_catalogos` AS
SELECT
  id,
  poster,
  titulo,
  categoria,
  GROUP_CONCAT(DISTINCT genero ORDER BY genero SEPARATOR ', ') AS genero,
  resumen,
  temporadas,
  GROUP_CONCAT(DISTINCT reparto ORDER BY reparto SEPARATOR ', ') AS reparto,
  trailer
FROM trailerflix.vista_trailerflix
GROUP BY id;

-- --------------------------------------------------------------------------------------------
-- Visualización de la vista tal cual se visualiza en el archivo original JSON TrailerFliz.json
-- --------------------------------------------------------------------------------------------
   SELECT * FROM trailerflix.vista_catalogos;
-- --------------------------------------------------------------------------------------------
