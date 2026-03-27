// DFRobot Gravity Heart Rate Sensor - Analog
// Arduino → LabVIEW (VISA Serial)

const int sensorPin = A0;

void setup() {
  Serial.begin(115200); // szybka transmisja dla płynnych danych
}

void loop() {
  int sensorValue = analogRead(sensorPin);  // sygnał PPG
  unsigned long timestamp = millis();       // ms od startu

  // Format CSV: timestamp, wartość
  Serial.print(timestamp);
  Serial.print(",");
  Serial.println(sensorValue);

  delay(100); // ~200 Hz próbkowania (reguluj według potrzeb)
}
