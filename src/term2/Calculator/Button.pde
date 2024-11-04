class Button {
  // Member Variables
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on, isNum;



  // Constructor
  Button(int x, int y, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    w = 60;
    h = 60;
    c1 = color(127);
    c2 = color(150);
    this.val = val;
    on=false;
    this.isNum = isNum;
  }


  //Member Methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(val, x, y);
  }


  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
