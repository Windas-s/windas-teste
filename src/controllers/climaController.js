var climaModel = require("../models/climaModel");

function armazenarClima(req, res) {
    var cidade = req.body.cidadeServer;
    var temperatura = req.body.tempServer;
    var umidade = req.body.umidadeServer;

    // Faça as validações dos valores
    if (cidade == undefined) {
        res.status(400).send("A cidade está undefined!");
    } else if (temperatura == undefined) {
        res.status(400).send("A temperatura estpá undefined!");
    } else if (umidade == undefined) {
        res.status(400).send("A umidade está undefined!");
    }
    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    else
        climaModel
            .armazenarClima(cidade, temperatura, umidade)
            .then(function (resultado) {
                res.json(resultado);
            })
            .catch(function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o insert! Erro: ",
                    erro.sqlMessage,
                );
                res.status(500).json(erro.sqlMessage);
            });
}

module.exports = {
    armazenarClima
}