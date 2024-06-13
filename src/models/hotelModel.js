var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM hotel WHERE idHotel = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT * FROM hotel`;

  return database.executar(instrucaoSql);
}


module.exports = { buscarPorId, listar };
