/*
  Analog Read/Write 
  Turns on an LED while button is pressed, then off if button is released.
 
  This example code is in the public domain.
 */
 
// an LED connected on most Arduino boards.
// give it a name:
int led = 11;


// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);  
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {

  // read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  

  int brightness; //0 - 255
  brightness = map(sensorValue,0,1023,0,255);
   
  // print out the value you read:
  //Serial.write(brightness); 
  Serial.println(brightness);
  
  analogWrite(led, brightness);   // turn the LED on (HIGH is the voltage level)

  delay(100);               // wait for a while

}
