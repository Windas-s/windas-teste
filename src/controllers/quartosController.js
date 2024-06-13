var aquarioModel = require("../models/quartosModel");

function buscarQuartosPorHotel(req, res) {
  var idUsuario = req.params.idUsuario;

  aquarioModel.buscarQuartosPorHotel(idUsuario).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os Quartos: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


module.exports = {
  buscarQuartosPorHotel
}