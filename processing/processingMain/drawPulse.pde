/*
 * Sketch: drawPulse.pde
 * 
 * 
 *  CREATED BY Joel Murphy
 *  MODIFIED @ APRIL, 2016
 */


// DRAW THE PULSE WAVEFORM
void drawPulse() { //<>// //<>//
  // prepare pulse data points    
  RawY[RawY.length-1] = (1023 - Sensor) - 212;   // place the new raw datapoint at the end of the array
  zoom = scaleBar.getPos();                      // get current waveform scale value
  offset = map(zoom,0.5,1,150,0);                // calculate the offset needed at this scale
  
  for (int i = 0; i < RawY.length-1; i++) {      // move the pulse waveform by
    RawY[i] = RawY[i+1];                         // shifting all raw datapoints one pixel left
    float dummy = RawY[i] * zoom + offset;       // adjust the raw data to the selected scale
    ScaledY[i] = constrain(int(dummy), 44, 556); // transfer the raw data array to the scaled array
    // println(dummy + "\n");
    // println(ScaledY[i] + "\n");
  }
  
  // draw it according to the 'ScaledY' value.
  stroke(250,0,0);  // red 
  noFill();
  beginShape();     // using beginShape() renders fast
  
  for (int x=1; x < ScaledY.length-1; x++) {    
     vertex(x+10, ScaledY[x]);                    //draw a line connecting the data points
  }
  endShape();
}


// GRAPH BPM WAVEFORM
void drawBPM() {
  if (beat == true) // move the heart rate line over one pixel every time the heart beats 
  {    
    beat = false;      // clear beat flag (beat flag waset in serialEvent tab)
    for (int i=0; i<rate.length-1; i++){
      rate[i] = rate[i+1];                      // shift the bpm Y coordinates over one pixel to the left
    }
  
    // then limit and scale the BPM value
    BPM = min(BPM, 200);                        // limit the highest BPM value to 200
    float dummy = map(BPM, 0, 200, 555, 215);   // map it to the heart rate window Y
    rate[rate.length-1] = int(dummy);           // set the rightmost pixel to the new data point value
  } 
 
  // GRAPH THE HEART RATE WAVEFORM
  stroke(250,0,0);                          // color of heart rate graph
  strokeWeight(2);                          // thicker line is easier to read
  noFill();
  beginShape();
  for (int i=0; i < rate.length-1; i++){    // variable 'i' will take the place of pixel x position   
    vertex(i+510, rate[i]);                 // display history of heart rate datapoints
  }
  endShape();
}


// DRAW HEART BEATING
void drawHeart() {
  
  fill(250,0,0);
  stroke(250,0,0);
  // the 'heart' variable is set in serialEvent when arduino sees a beat happen
  heart--;                    // heart is used to time how long the heart graphic swells when your heart beats
  heart = max(heart,0);       // don't let the heart variable go into negative numbers
  
  if (heart > 0)              // if a beat happened recently,
  {              
    strokeWeight(8);          // make the heart big
  }
  
  smooth();   // draw the heart with two bezier curves
  bezier(width-100,50, width-20,-20, width,140, width-100,150);
  bezier(width-100,50, width-190,-20, width-200,140, width-100,150);
  strokeWeight(1);          // reset the strokeWeight for next time
}