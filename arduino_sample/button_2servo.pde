#include <Servo.h> 
 
Servo myservo1;
Servo myservo2;

const int servo1Pin = 9;
const int servo2Pin = 10;
const int buttonPin = 7;
const int ledPin = 13;

int buttonState = 0;
const int pos1_offset = 30;
const int pos2_offset = 90;

int pos1 = pos1_offset;
int pos2 = pos2_offset;

void setup() 
{ 
  myservo1.attach(servo1Pin);
  myservo2.attach(servo2Pin);
  myservo1.write(pos1);
  myservo2.write(pos2);

  pinMode(ledPin, OUTPUT);
  pinMode(buttonPin, INPUT);
} 
 
 
void loop() 
{
  buttonState = digitalRead(buttonPin);
  
  if (buttonState == HIGH) {
    digitalWrite(ledPin, HIGH);
  
    for(pos1 = pos1_offset; pos1 < pos1_offset + 60; pos1 += 1)
    {
      myservo1.write(pos1);
      myservo2.write(pos2);
      delay(15);
    } 
    for(pos2 = pos2_offset; pos2 > pos2_offset - 90; pos2 -= 1)
    {
      myservo1.write(pos1);
      myservo2.write(pos2);
      delay(5);
    } 
    for(; pos2 <= pos2_offset; pos2 += 1)
    {
      myservo1.write(pos1);
      myservo2.write(pos2);
      delay(5);
    } 
    for(pos2 = pos2_offset; pos2 > pos2_offset - 90; pos2 -= 1)
    {
      myservo1.write(pos1);
      myservo2.write(pos2);
      delay(5);
    } 

    for(pos1 = pos1_offset + 60; pos1>=pos1_offset; pos1-=1, pos2+=1)
    {                                
      myservo1.write(pos1);
      myservo2.write(pos2);
      delay(10);
    }
    for (; pos2 <= pos2_offset; pos2+=1) {
      myservo2.write(pos2);
      delay(10);   
    }
  } else {
    delay(50);
  }
}
