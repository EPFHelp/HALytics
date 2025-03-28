#include "Arduino.h"

void setup() {
  Serial.begin(115200);
}

void loop() {
  Serial.println("Welcome to HALytics!");
  delay(1000);
}