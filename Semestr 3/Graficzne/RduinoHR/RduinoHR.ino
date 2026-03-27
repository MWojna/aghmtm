const int sensorPin = A0;

void  setup() {
  Serial.begin(115200);
}

void loop() {
  int sensorValue = analogRead(sensorPin);
  unsigned long timestamp = millis();
  Serial.print(timestamp);
  Serial.print(",");
  Serial.println(sensorValue);
  delay(100);
}
