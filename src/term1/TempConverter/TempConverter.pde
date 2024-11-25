// Jae Karppinen | Temp Converter | 23 Sept 2024

void setup() {
  size(400,200);
}

void draw() {
  background(128);
  text("Tempature Converter by Jae Karppinen",width/2, 30);
  text("Slide your mouse across the line to see the tempature of fahrenheit \n that is equivelent to the celsius", width/2, 90); 
  line(0,150,width,150);
  for(int i=-200; i<width+1; i=i+50) {
    line(i,145,i,155);
    textAlign(CENTER);
    text(i,i+200,165);
  }
  text("Cel: " + (mouseX-200),width/2,190);
  text("Far: " + celToFar(mouseX-200),width/2,130);
  
  println("MouseX:" + mouseX + " : " + farToCel(mouseX));
}

float farToCel(float tempFar) {
  // formula to calc cel conv
  tempFar = (tempFar-32) * (5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  // formula to celc far conv
  tempCel = tempCel * 9.0/5.0 + 32;
  return tempCel;
}
