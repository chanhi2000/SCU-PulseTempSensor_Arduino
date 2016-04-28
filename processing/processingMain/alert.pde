
/*
 *  Sketch: serialEvent.pde
 *  
 *  This sketch manages the serial event.
 */

void playAlert() {
  
  // Pulse Alert condition
  if (Sensor > 900 || Sensor < 300 ) {
    alertNow = true; 
  } else {
    alertNow = false;
  }
  
  playNow(alertNow);
  
  // Temperature Alert Condition
  if (temp_c > 34 || temp_c < 18 ) {
    alertNow = true;
  } else {
    alertNow = false;
  }
  
  playNow(alertNow);
}



void playNow(boolean trigger) {
  if (trigger) {
    alert.rewind();
    alert.play();
  }
}