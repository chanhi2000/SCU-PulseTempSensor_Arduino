/* 
 * runs once when you turn your Arduino on. We initialize the serial connection with the computer
 */

void serialOutputTemperature() {
  //getting the voltage reading from the temperature sensor
  int reading = analogRead(tempPin); 

  // converting that reading to voltage, for 3.3v arduino use 3.3
  float voltage = reading * 5 / 1024.0; 

  // raw data
#if ENABLE_DEBUGTEMP
  Serial.println(ENABLE_DEBUGTEMP);
  Serial.print("raw signal reading: ");
  Serial.println(reading);
  Serial.print("evaluated voltage: ");
  Serial.println(voltage);
#endif
  
  // printTemperature(voltage);
  // delay(1000);
}

void printTemperature(float voltage) {  
  //converting from 10 mv per degree wit 500 mV offset
  float t_Celsius = (voltage) * 100 ; 
  
  //to Celsius ((volatge - 500mV) times 100)
  Serial.println("======= temperature =======");
  Serial.print(t_Celsius); 
  Serial.println(" degress C");

  // convert to Fahrenheit
  float t_Fahrenheit = (t_Celsius * 9 / 5) + 32;
  Serial.print(t_Fahrenheit); 
  Serial.println(" degress F");
}
