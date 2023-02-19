/*  
 * JOB 5 : Membaca potensio via mqtt
 * Written by : Muhammad Husni Muttaqin (1503467)
 * 
 */


#include <WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>

#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);


const char* ssid = "Wifihusni12";
const char* password = "123456789";
const char* mqtt_server = "broker.emqx.io";

WiFiClient espClient;
PubSubClient client(espClient);

#include "DHT.h"

#define DHTPIN 16 

#define DHTTYPE DHT11 


DHT dht(DHTPIN, DHTTYPE);


float temperature;
float humidity;


const int infrared_pin = 17;
int infrared_status;
long lastMsg = 0;
char msg[50];
int value = 0;

const int led1_pin = 2;

const int potensiometer_pin = 34;
float potensiometer;

unsigned long data_send_time;
unsigned long data_send_time_prev;
unsigned long data_send_period = 2000;

unsigned long buzzer_time;
unsigned long buzzer_time_prev;

const int buzzer_pin = 5;

void setup() {
  
  lcd.begin();
  lcd.clear();
  lcd.backlight();
  lcd.setCursor(0,0);
  lcd.print(mqtt_server);

  pinMode(buzzer_pin, OUTPUT);
  

  ledcSetup(0, 1000, 8);
  ledcAttachPin(buzzer_pin, 0);

  pinMode(potensiometer_pin, INPUT);
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  pinMode(infrared_pin, INPUT);
  dht.begin();  
}

void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
    lcd.setCursor(0,1);
    lcd.print("ATTEMPTING");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  lcd.setCursor(0,1);
  lcd.print("CONNECTED ");
}

void callback(char* topic, byte* message, unsigned int length) {
  Serial.print("Message arrived on topic: ");
  Serial.print(topic);
  Serial.print(". Message: ");
  String messageTemp;
  
  for (int i = 0; i < length; i++) {
    Serial.print((char)message[i]);
    messageTemp += (char)message[i];
  }
  Serial.println();

  
  if (String(topic) == "trainer_iot_upi_01/led1") {
    Serial.print("Changing output to ");
    if(messageTemp == "on"){
      Serial.println("ON");
      digitalWrite(led1_pin, HIGH);
    }
    else if(messageTemp == "off"){
      Serial.println("OFF");
      digitalWrite(led1_pin, LOW);
    }
  }
}



void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    if (client.connect("ESP32Client")) {
      Serial.println("connected");
      client.subscribe("trainer_iot_upi_01/led1");
     
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}


void loop() {
  if (!client.connected()) {
    reconnect();
    
  }

  infrared_status = digitalRead(infrared_pin);

  if (infrared_status == 0){

      ledcWrite(0, 200);
  }
    else {
    ledcWrite(0, 0);
  }

  data_send_time = millis() - data_send_time_prev;
  if (data_send_time > data_send_period){

    potensiometer = analogRead(potensiometer_pin);
    
    char potensiometer_send[8];
    dtostrf(potensiometer, 1, 1, potensiometer_send);
    client.publish("trainer_iot_upi_01/potensiometer", potensiometer_send);


    temperature = dht.readTemperature();
    
    char temperature_send[8];
    dtostrf(temperature, 1, 2, temperature_send);
    client.publish("trainer_iot_upi_01/temperature", temperature_send);
    
    
    humidity = dht.readHumidity();
    char humidity_send[8];
    dtostrf(humidity, 1, 2, humidity_send);
    client.publish("trainer_iot_upi_01/humidity", humidity_send);
    

    
    
    if (infrared_status == 1){
      client.publish("trainer_iot_upi_01/infrared","SAFE");
    } else {
      client.publish("trainer_iot_upi_01/infrared","DANGER");
    }

    
    data_send_time_prev = millis();
  }

  
  client.loop();
  }
