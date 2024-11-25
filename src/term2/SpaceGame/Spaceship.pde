class Spaceship {
  // Member Variables
  int x, y, w, lazerCount, turretCount, health;

  // Constructor
  Spaceship() {

    x = width/2;
    y = height/2;
    w = 100;
    lazerCount = 100;
    turretCount = 1;
    health = 100;
  }
  // Member Methods
  void display() {
    fill(50);
    //Fire from thrusters
    stroke(#F03211);
    fill(#F0CF11);
    triangle(x+16, y+45, x+13, y+35, x+19, y+35);
    triangle(x-16, y+45, x-13, y+35, x-19, y+35);
    stroke(0);
    fill(50);
    // thrusters
    rect(x+10, y+20, 6, 15);
    rect(x+15, y+20, 6, 20);
    rect(x-17, y+20, 6, 15);
    rect(x-22, y+20, 6, 20);
    stroke(80);
    fill(127);
    // wing
    stroke(0);
    triangle(x, y-54, x+45, y+25, x-45, y+25);
    fill(99);
    // cetner
    ellipse(x, y-10, 15, 60);
    fill(#F01111);
    triangle(x, y-35, x+5, y-20, x-5, y-20);
    // cannons
    fill(50);
    noStroke();
    rect(x+29, y-20, 2, 30);
    rect(x-30, y-20, 2, 30);
    stroke(0);
    triangle(x+30, y+5, x+35, y+20, x+25, y+20);
    triangle(x-30, y+5, x-35, y+20, x-25, y+20);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y= tempY;
  }

  boolean fire() {
    if(lazerCount > 0){
      return true;
    }else {
    return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x,y,r.x,r.y);
    if(d<50) {
    return true;
    } else {
    return false;
    }
  }
}
