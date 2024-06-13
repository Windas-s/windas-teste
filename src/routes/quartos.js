var express = require("express");
var router = express.Router();

var quartosController = require("../controllers/quartosController");

router.get("/:hotelId", function (req, res) {
  quartosController.buscarQuartosPorHotel(req, res);
});

/* router.post("/cadastrar", function (req, res) {
  quartosController.cadastrar(req, res);
}) */

module.exports = router;