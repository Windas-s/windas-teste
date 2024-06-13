var express = require("express");
var router = express.Router();

var hotelController = require("../controllers/hotelController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    hotelController.cadastrar(req, res);
})

router.get("/buscar/:id", function (req, res) {
  hotelController.buscarPorId(req, res);
});

router.get("/listar", function (req, res) {
  hotelController.listar(req, res);
});

module.exports = router;