//Jae Karppinen | Calculator | September 30th 2024
Button[] buttons = new Button[23];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup() {
  size(300, 400);
  background(50);
  l  = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(30, 310, "0", true);
  buttons[1] = new Button(30, 250, "1", true);
  buttons[2] = new Button(30, 190, "4", true);
  buttons[3] = new Button(30, 130, "7", true);
  buttons[4] = new Button(30, 370, "%", false);
  buttons[5] = new Button(90, 310, ".", false);
  buttons[6] = new Button(90, 250, "2", true);
  buttons[7] = new Button(90, 190, "5", true);
  buttons[8] = new Button(90, 130, "8", true);
  buttons[9] = new Button(90, 370, "±", false);
  buttons[10] = new Button(150, 310, "√", false);
  buttons[11] = new Button(150, 250, "3", true);
  buttons[12] = new Button(150, 190, "6", true);
  buttons[13] = new Button(150, 130, "9", true);
  buttons[14] = new Button(210, 310, "^", false);
  buttons[15] = new Button(210, 250, "×", false);
  buttons[16] = new Button(210, 190, "+", false);
  buttons[17]= new Button(210, 130, "Del", false);
  buttons[18] = new Button(270, 310, "=", false);
  buttons[19] = new Button(270, 250, "÷", false);
  buttons[20] = new Button(270, 190, "-", false);
  buttons[21] = new Button(270, 130, "C", false);
  buttons[22] = new Button(150, 370, "π", false);
}

void draw() {
  background(50);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}




void updateDisplay() {
  fill(200);
  rectMode(CENTER);
  rect(width/2, 25, 300, 80);
  fill(0);
  if (dVal.length()<13 ) {
    textSize(40);
  } else if (dVal.length() == 13) {
    textSize(35);
  } else if (dVal.length() == 14) {
    textSize(33);
  } else if (dVal.length() == 15) {
    textSize(31);
  } else if (dVal.length() == 16) {
    textSize(30);
  } else if (dVal.length() == 17) {
    textSize(28);
  } else if (dVal.length() == 18) {
    textSize(27);
  } else if (dVal.length() == 19) {
    textSize(26);
  } else if (dVal.length() == 20) {
    textSize(25);
  }

  textAlign(RIGHT);
  text(dVal, width-20, 55);
}

void mouseReleased() {
  println("left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + "L:" + left);
  for (int i = 0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length()<15) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length()<15) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      dVal = "0";
      l  = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals(".")) {

      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      op = '+';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      op = '-';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("×")) {
      op = '*';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      op = '/';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      handleEvent("=", false);
    } else if (buttons[i].on && buttons[i].val.equals("±")) {
      if (left == true) {
        l *= -1;
        dVal = str(l);
      } else if (left == false) {
        r *= -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (left) {
        r *= sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("π")) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else if (left) {
        r *= PI;
        dVal = str(r);
      }
      // percentage into a decimal number
    } else if (buttons[i].on && buttons[i].val.equals("%")) {
      if (left) {
        l*=0.01;
        dVal = str(l);
      } else if (left) {
        r*=0.01;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("^")) {
      op = 'e';
      left = false;
      dVal ="0";
    } else if (buttons[i].on && buttons[i].val.equals("Del")) {
      handleEvent("Del", false);
    }
  }
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == 'e') {
    result = pow(l, r);
  }
  dVal = str(result);
}

void keyPressed() {
  println("Key:" + key);
  println("Keycode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (key == '+' || keyCode ==107) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '/' || keyCode == 47 || keyCode == 111) {
    handleEvent("/", false);
  } else if (key == '.' || keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 8) {
    handleEvent("Del", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() < 15 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 15 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal == "=" && !isNum) {
    performCalc();
  } else if (keyVal == "Del") {
    if (dVal.length()>0) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float(dVal);
      }
    }
  }
}
