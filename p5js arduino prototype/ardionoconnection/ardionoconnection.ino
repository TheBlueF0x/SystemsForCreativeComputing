#define potPin A0
int value;

void setup() {
  Serial.begin(9600); //intailise Serial communication with 9600 baud rate
  pinMode( potPin, INPUT );
}

void loop() {
  value = analogRead( potPin);
  Serial.println(value); //read the sensor and send the value to the Serial
  delay(100); //little delay to prevent Arduino going crazy
}