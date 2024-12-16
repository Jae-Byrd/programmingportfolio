class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char  type;
  PImage r1;
  PImage r2;
  PImage r3;
  // Constructor
  Powerup() {
    x = int(random(width));
    y = -100;
    diam = 30;
    speed = int(random(1, 5));
    r1 = loadImage("Ammo.png");
    r2 = loadImage("Heart.png");
    r3 = loadImage("Turret.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'h';
    } else if (rand == 1) {
      type = 'a';
    } else if (rand == 2) {
      type = 't';
    }
  }
  // Member Methods
  void display() {
    if (type == 'h') {
      image(r2,x,y);
    } else if (type == 'a') {
       image(r1,x,y);
    } else if (type == 't') {
      image(r3,x,y);
    }
   
   // ellipse(x, y, diam, diam);
    //imageMode(CENTER);
    //r1.resize(diam, diam);
    // image(r1, x, y);
  }

  void move() {
    y += speed;
  }
  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else
    {
      return false;
    }
  }
}
