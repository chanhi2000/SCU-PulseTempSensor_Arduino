/*
 * Sketch: processingMain.pde
 * 
 * THIS PROGRAM WORKS WITH PulseSensorAmped_Arduino-xx ARDUINO CODE
 * THE PULSE DATA WINDOW IS SCALEABLE WITH SCROLLBAR AT BOTTOM OF SCREEN
 * PRESS 'S' OR 's' KEY TO SAVE A PICTURE OF THE SCREEN IN SKETCH FOLDER (.jpg)
 * 
 * CREATED BY Joel Murphy
 * MODIFIED BY Chan Hee Lee
 * @ APRIL, 2016
 * see original code here
 * https://github.com/WorldFamousElectronics/PulseSensor_Amped_Processing_Visualizer/ //<>//
 */

import processing.serial.*;
PFont font;
Scrollbar scaleBar;
Serial port;

int Sensor;      // HOLDS PULSE SENSOR DATA FROM ARDUINO
int IBI;         // HOLDS TIME BETWEN HEARTBEATS FROM ARDUINO
int BPM;         // HOLDS HEART RATE VALUE FROM ARDUINO
int temp_c;      // HOLDS TEMPERATURE VALUE IN CELSIUS FROM ARDUINO
int temp_f;
int[] RawY;      // HOLDS HEARTBEAT WAVEFORM DATA BEFORE SCALING
int[] ScaledY;   // USED TO POSITION SCALED HEARTBEAT WAVEFORM
int[] rate;      // USED TO POSITION BPM DATA WAVEFORM
float zoom;      // USED WHEN SCALING PULSE WAVEFORM TO PULSE WINDOW
float offset;    // USED WHEN SCALING PULSE WAVEFORM TO PULSE WINDOW
color eggshell = color(255, 253, 248);
int heart = 0;   // This variable times the heart image 'pulse' on screen

//  THESE VARIABLES DETERMINE THE SIZE OF THE DATA WINDOWS
int PulseWindowWidth = 490;
int PulseWindowHeight = 512; 
int BPMWindowWidth = 180;
int BPMWindowHeight = 340;
boolean beat = false;    // set when a heart beat is detected, then cleared when the BPM graph is advanced


void setup() {
  size(700, 600);  // Stage size
  frameRate(100);  
  font = loadFont("Arial-BoldMT-24.vlw");
  textFont(font);
  textAlign(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);  
  
  // Scrollbar constructor inputs: x,y,width,height,minVal,maxVal
  scaleBar = new Scrollbar(400, 575, 180, 12, 0.5, 1.0);  // set parameters for the scale bar
  RawY = new int[PulseWindowWidth];          // initialize raw pulse waveform array
  ScaledY = new int[PulseWindowWidth];       // initialize scaled pulse waveform array
  rate = new int[BPMWindowWidth];            // initialize BPM waveform array
  zoom = 0.75;                               // initialize scale of heartbeat window
    
  // set the visualizer lines to 0
  for (int i=0; i<rate.length; i++) {
    rate[i] = 555;      // Place BPM graph line at bottom of BPM Window 
  }
  
  for (int i=0; i<RawY.length; i++){
    RawY[i] = height/2; // initialize the pulse window data line to V/2
  }
  
  // GO FIND THE ARDUINO
  println(Serial.list());    // print a list of available serial ports
  
  // choose the number between the [] that is connected to the Arduino
  port = new Serial(this, Serial.list()[1], 115200);  // make sure Arduino is talking serial at this baud rate
  port.clear();            // flush buffer
  port.bufferUntil('\n');  // set buffer full flag on receipt of carriage return
}
  
void draw() {
  background(0);
  noStroke();
  
  // DRAW OUT THE PULSE WINDOW AND BPM WINDOW RECTANGLES  
  fill(eggshell);  // color for the window background
  rect(255, height/2, PulseWindowWidth, PulseWindowHeight);
  rect(600, 385, BPMWindowWidth, BPMWindowHeight);
  
  println(port.readStringUntil('\n'));
  
  // DRAW THE PULSE WAVEFORM
  drawPulse();
  /*
   * INPUT: 
   * - Sensor, RawY, ScaledY, zoom
   * OUTPUT:
   * - Draw waveform according to the value of 'ScaledY'
   */

  // GRAPH BPM WAVEFORM 
  drawBPM();
  /*
   * INPUT:
   * - beat, rate, BPM, 
   * OUTPUT:
   * - Draw waveform for BPM
   */
  
  // DRAW HEART BEATING
  // drawHeart();

  // PRINT THE DATA AND VARIABLE VALUES
  fill(eggshell);                                       // get ready to print text
  text("Pulse + Temp Visualizer 1.2", 245, 30);         // tell them what you are
  text("IBI " + IBI + "mS",600,585);                    // print the time between heartbeats in mS
  text(BPM + " BPM",600,200);                           // print the Beats Per Minute
  text("Pulse Window Scale " + nf(zoom,1,2), 150, 585); // show the current scale of Pulse Window
  text("CELSIUS " + temp_c, 600, 120);
  text("FAHRENHEIT " + temp_f, 600, 100);
  
  // DO THE SCROLLBAR THINGS
  scaleBar.update (mouseX, mouseY);
  scaleBar.display();
   
  // DRAW TEMPERATURE VALUE
  // drawTemp();
   
}  //end of draw loop