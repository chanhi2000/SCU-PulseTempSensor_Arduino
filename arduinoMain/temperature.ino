/* 
 * runs once when you turn your Arduino on. We initialize the serial connection with the computer
 */

void serialOutputTemperature() {
  //getting the voltage reading from the temperature sensor
  int reading = analogRead(tempPin); 
  
  // converting that reading to voltage, for 3.3v arduino use 3.3
  float voltage = reading * 5 / 1024.0; 
  float temp_c = (voltage) * 100 ; 
  
  // raw data
  #if ENABLE_DEBUGTEMP
  Serial.println(ENABLE_DEBUGTEMP);
  Serial.print("raw signal reading: ");
  Serial.println(reading);
  Serial.print("evaluated voltage: ");
  Serial.println(voltage);
  #endif
  
  if (serialVisual == true) {
    printTemp(temp_c);
  } else {
    sendDataToSerial('T',temp_c);
    sendDataToSerial('F', (temp_c * 9) / 5 + 32 );
  }
  // printTemperature(voltage);
  // delay(1000);
}


void printTemp(float temp_c) {
  //to Celsius
  Serial.println("======= temperature =======");
  Serial.print(temp_c); 
  Serial.println(" degress C");

  //to Fahrenheit
  float temp_f = (temp_c * 9 / 5) + 32;
  Serial.print(temp_f);
  Serial.println(" degress F");  
}
