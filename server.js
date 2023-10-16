const express = require('express');
const bodyParser = require('body-parser');
const sequelize = require('./src/conexion/connection');
const Categoria = require('./src/modelos/Categorias');
const Catalogo  = require('./src/modelos/Vista_Catalogos');
const dotenv = require('dotenv');
const {Op} = require('sequelize');

const app = express();


app.use(async (req, res, next) => {
  try {
        await sequelize.authenticate();
        console.log('Conexión exitosa a la base de datos.');
        await Categoria.sync();
        await Catalogo.sync();
        next();
  } catch (error) {
        res.status(500).json({ error: 'Error en el servidor', descripcion: error.message });
  }
});

app.use(bodyParser.json());


// Inicio CRUD Categorias

// Ruta para obtener todas las categorias
app.get('/categorias', async (req, res) => {
  try {
    const categorias = await Categoria.findAll();
    res.json(categorias);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener categorias' });
  }
});

// Ruta para crear una nueva categoria
app.post('/categorias', async (req, res) => {
  try {
    const categorias = await Categoria.create(req.body);
    res.json(categorias);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al crear una categoria' });
  }
});

// Ruta para actualizar una categoria por ID
app.put('/categorias/:id', async (req, res) => {
    const categoriaId = req.params.id;
    const categoriaData = req.body;
  
    try {
      const categoria = await Categoria.findByPk(categoriaId);
  
      if (!categoria) {
        return res.status(404).json({ error: 'Categoria no encontrada' });
      }
  
      // Actualiza los campos de la categoria con los nuevos datos
      await categoria.update(categoriaData);
  
      return res.json(categoria);
    } catch (err) {
      console.error(err);
      return res.status(500).json({ error: 'Error al actualizar la categoria' });
    }
  });

// Ruta para eliminar una categoria por ID
app.delete('/categorias/:id', async (req, res) => {
    const id_categoria = req.params.id;
    try {
      const categoria = await Categoria.findByPk(id_categoria); 
      
      if (!categoria) {
        return res.status(404).json({ error: 'Categoría no encontrada' });
      }

      // Elimina la categoria
      await categoria.destroy();
   
      //res.json(categoria);
      return res.json({ mensaje: 'Categoría eliminada exitosamente' });
    } 
    catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Error al eliminar una categoría' });
    }
});

// Fin CRUD Categorias


// Inicio Consultas de Catalogos

// Ruta para obtener todo el catalogo
app.get('/catalogos', async (req, res) => {
    try {
        const allCatalogos = await Catalogo.findAll();
        allCatalogos.length !== 0 ? res.status(200).json(allCatalogos)
                : res.status(404).json({ error: "No se encontraron catalogos para listar." });
    } catch (err) {
        res.status(500).json({ error: 'Error en el servidor, al obtener los catalogos', description: error.message });
    }
  });

  
// Ruta para consultar el catalogo por Código
app.get('/catalogos/:catalogoID', async (req, res) => {
    try {
        const {catalogoID} = req.params;
        const catalogo =  await Catalogo.findByPk(catalogoID);
        
        !catalogo   ? res.status(404).json({ error: "Catálogo no encontrado." })
                    : res.status(200).json(catalogo); // devuelve los campos del catalogo segun ID.
    } catch (err) {
        res.status(500).json({ error: 'Error en el servidor, al buscar el catálogo', description: error.message });
    }
  });

  // Ruta para consultar el catalogo por Titulo/Nombre de la pelicula o serie
  app.get('/catalogos/nombre/:query', async (req, res) => {
    try {
          const { query } = req.params;
          const catalogo = await Catalogo.findAll({ 
                where: { titulo: {
                                [Op.like]: `%${ query }%` ,
                                }, 
                    }, 
        });

        !catalogo ? res.status(404).json({ error: 'Catálogo no encontrado' })
                  : res.status(200).json(catalogo);
    } catch (error) {
          res.status(500).json({ error: 'Error en el servidor, al buscar catálogo por Título', description: error.message });
    }
});

//iii.	/catalogo/:genero (filtrar por género de la pelicula o serie)
app.get('/catalogos/genero/:query', async (req, res) => {
    try {
          const { query } = req.params;
          const catalogo = await Catalogo.findAll({ 
                where: { genero: {
                                    [Op.like]: `%${ query }%` ,
                                }, 
                    }, 
        });

        !catalogo ? res.status(404).json({ error: 'Catálogo no encontrado' })
                  : res.status(200).json(catalogo);
    } catch (error) {
          res.status(500).json({ error: 'Error en el servidor, al buscar catálogo por Género', description: error.message });
    }
});

//iv. /catalogo/:categoria (filtrar por serie – película o cualquier otra categoría que pueda existir):
app.get('/catalogos/categoria/:query', async (req, res) => {
    try {
          const { query } = req.params;
          const catalogo = await Catalogo.findAll({ 
                where: { categoria: {
                                    [Op.eq]: `${ query }` ,
                                }, 
                    }, 
        });

        !catalogo ? res.status(404).json({ error: 'Catálogo no encontrado' })
                  : res.status(200).json(catalogo);
    } catch (error) {
          res.status(500).json({ error: 'Error en el servidor, al buscar catálogo por Categoría', description: error.message });
    }
});

// Fin Consultas de Catalogos


// Iniciar el servidor
const port = process.env.DB_PORT || 3000; //prioridad pueto en archivo .env sino puerto 3000.
app.listen(port, () => {
    console.log(`Servidor Express en funcionamiento en el puerto ${port}`);
});
