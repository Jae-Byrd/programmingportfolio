class Lazer {
  // Member Variables
  int x, y, w, h, speed;

  // Constructor
  Lazer(int x, int y) {
    this.x = x;
    this.y = y;
    w = 3;
    h = 20;
    speed = 10;
  }
  // Member Methods
  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-20-h) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
