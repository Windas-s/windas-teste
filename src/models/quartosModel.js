var database = require("../database/config");

function buscarQuartosPorHotel(hotelId) {

  var instrucaoSql = `SELECT * FROM quarto WHERE fk_hotel = ${hotelId}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

/* function cadastrar(hotelId, descricao) {
  
  var instrucaoSql = `INSERT INTO (descricao, fk_hotel) aquario VALUES (${descricao}, ${hotelId})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
} */


module.exports = {
  buscarQuartosPorHotel
}
