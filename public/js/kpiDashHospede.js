idQuarto = 1;

function verificarEstadoQuarto(resposta) {
    const kpiTemp = document.getElementById('kpi_temp');
    const kpiUmid = document.getElementById('kpi_umid');
    const kpiProx = document.getElementById('kpi_prox');
    const kpiAlerta = document.getElementById('kpi_alerta');

    let temp = resposta[resposta.length - 1].temperatura;

    let limitesTemperatura = {
        quente: 26,
        ideal: 24,
        frio: 19,
    };

    let limitesUmidade = {
        acima: 61,
        ideal: 30,
        frio: 29,
    };

    let classe_temperatura = "cor-alerta";
    let classe_umidade = "cor-alerta";
    let classe_proximidade = "cor-alerta";
    let classe_alerta = "cor-alerta";


    /*--------------KPI TEMPERATURA----------------*/
    if (temp < limitesTemperatura.ideal) {
        classe_temperatura = "temperatura-baixa container";
    } else if (
        temp >= limitesTemperatura.ideal &&
        temp <= limitesTemperatura.quente
    ) {
        classe_temperatura = "temperatura-ideal container";
    } else if (temp > limitesTemperatura.quente) {
        classe_temperatura = "temperatura-quente container";
    }

    /*------------------KPI UMIDADE---------------- */

    let umid = resposta[resposta.length - 1].umidade;

    if (umid < limitesUmidade.ideal) {
        classe_umidade = "umidade-abaixo container card";
    } else if (umid >= limitesUmidade.ideal && umid < limitesUmidade.acima) {
        classe_umidade = "umidade-ideal container card";
    } else if (umid >= limitesUmidade.acima) {
        classe_umidade = "umidade-alta container card";
    }

    /*-----------------KPI PROXIMIDADE-------------*/

    let prox = resposta[resposta.length - 1].janela;

    if (prox >= 1) {
        classe_proximidade = "janela-fechada container card";
    } else {
        classe_proximidade = "janela-aberta container card";
    }

    kpiTemp.className = classe_temperatura;
    kpiUmid.className = classe_umidade;
    kpiProx.className = classe_proximidade;

}