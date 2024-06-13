var database = require("../database/config");

function armazenarClima(cidade, temperatura, umidade) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function armazenarClima():", cidade, temperatura, umidade);
    
    var instrucaoSql = `
        INSERT INTO infoClima (cidade, temperatura, umidade) VALUES ('${cidade}', '${temperatura}', '${umidade}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    armazenarClima
}