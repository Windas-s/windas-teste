#include "DHT.h"        // Biblioteca DHT11
#define dht_type DHT11  //Definir tipo DHT11

int dht_pin = A0;                    // Definir Pino Analogico 0 para sensor DHT
DHT dht_1 = DHT(dht_pin, dht_type);  // Declarar tipo do dht
int pinoSensor = 7;     // Definir Pino Digital do sensor XXXX       

void setup() {
  pinMode(pinoSensor, INPUT);  //Iniciar entrada do Pino do sensor XXXX
  Serial.begin(9600);
  dht_1.begin();
}

void loop() {
  float umidade = dht_1.readHumidity();         // Define variavel Umidade com valor Float da biblioteca DHT
  float temperatura = dht_1.readTemperature();  // Define variavel Temperatura com valor Float da biblioteca DHT
  int fksensor = 1;

  int chave;  

  if (digitalRead(pinoSensor) == LOW) {  // Se o sensor detectar algo.
    chave = 1;                // separa os valores no monitor serial
  } else {                               // Se sensor estiver livre.
    chave = 0;                 // separa os valores no monitor serial
  }

  if (isnan(temperatura) or isnan(umidade)) {  // Se houver algum erro e não devolver os dados em numeros exibe a mensagem:
    Serial.println("Erro ao ler");             // ERRO AO LER
  } else {
    for (int i = 0; i < 50; i++) {
    Serial.print(chave);  // imprime no monitor Serial Valor da Umidade
    Serial.print(",");
    Serial.print(umidade - i);  // ajusta o valor da umidade
    Serial.print(",");
    Serial.print(temperatura + i);  // ajusta o valor da temperatura
    Serial.print(",");
    Serial.println(fksensor + i);  // ajusta o valor do fksensor
}
  }

  delay(10000);  // Tempo para consultar os dados novamente
}