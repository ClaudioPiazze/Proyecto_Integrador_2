const { DataTypes } = require('sequelize');
const sequelize = require('../conexion/connection');

const Categoria = sequelize.define('Categoria', {
  id_categoria: {
    type: DataTypes.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
  },
  nombre: {
    type: DataTypes.STRING(50),
    allowNull: false,
    collate: 'utf8mb4_unicode_ci',
  },
}, {
  tableName: 'categorias',
  timestamps: false, // Opcional, para no utilizar campos de timestamp
  indexes: [
    {
      unique: true,
      fields: ['id_categoria'],
      name: 'unique_id_categoria',
    },
  ],
});

module.exports = Categoria;
