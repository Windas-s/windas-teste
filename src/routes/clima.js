var express = require("express");
var router = express.Router();

var climaController = require("../controllers/climaController");

router.post("/armazenarClima", function (req, res) {
    climaController.armazenarClima(req, res);
});

module.exports = router;