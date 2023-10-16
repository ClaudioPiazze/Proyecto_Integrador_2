const { DataTypes } = require('sequelize');
const sequelize = require('../conexion/connection');  // Reemplaza 'sequelize' con el nombre correcto de tu instancia de Sequelize

// Definición del modelo vista (no es una tabla)
const Catalogo = sequelize.define('vista_catalogos', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
  },
  poster:       DataTypes.STRING,
  titulo:       DataTypes.STRING,
  categoria:    DataTypes.STRING,
  genero:       DataTypes.STRING, // Como GROUP_CONCAT retorna una cadena
  resumen:      DataTypes.TEXT,
  temporadas:   DataTypes.INTEGER,
  reparto:      DataTypes.STRING, // Como GROUP_CONCAT retorna una cadena
  trailer:      DataTypes.STRING,
}, {
  timestamps: false, // Indica que el modelo no tiene columnas createdAt y updatedAt
  tableName: 'vista_catalogos', // Nombre de la vista en la base de datos
});

module.exports = Catalogo;
