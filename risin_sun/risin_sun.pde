/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
float mov;      // color for filling the rectangle.

void setup() 
{
  size(400, 400);
  colorMode(RGB);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{

  if ( myPort.available() > 0) {  // If data is available,
    String val = myPort.readStringUntil('\n');         // read it and store it in val
    if(val != null){
      println(val);
      mov = float(val) / 151 * 100; // convert String to float value.     
    }
  }
  
  background(255);             // Set background to white
  int[] x = {185, 215, 215, 185};
  int[] yA = {50, 50, 93, 93};
  int[] yB = {132, 132, 348, 348};
  int maxHt = (yB[2] - yB[1]) * 2;
  float currentHt = maxHt / 100 * mov;
  
  for(int i = 1; i < int(currentHt) ; i = i + 5){
    noStroke();
    fill(1, 1);
    arc(x[0] + ((x[1] - x[0]) / 2), yB[2], x[1] - x[0], i, PI, TWO_PI);
  }
  
  for(int j = 1; j < (x[1] - x[0]) * 2 ; j = j + 1){
    noStroke();
    fill(255, 0, 0, 0.02 * mov);
    ellipse(x[0] + ((x[1] - x[0]) / 2), yA[1] + (yA[2] - yA[1]) / 2, j, j);
  }
}
