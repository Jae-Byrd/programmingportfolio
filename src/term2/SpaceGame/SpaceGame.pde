// Jae Karppinen | Nov 6 2024 | SpaceGame
import processing.sound.*;
SoundFile lazer;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Lazer> lazers = new ArrayList<Lazer>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level, rockRate;
boolean play;
Timer rTime, puTime;

void setup() {
  size(800, 800);
  s1 = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  rockRate = 1000;
  rTime = new Timer(rockRate);
  rTime.start();
  puTime = new Timer(10000);
  puTime.start();
  lazer = new SoundFile(this, "laser1.wav");
}
void draw() {
  if (!play) {
    startScreen();
  } else {
    background(25);
    if (frameCount % 1000 == 0) {
      level++;
      rockRate -= 50;
      rTime.totalTime-=50;
    }
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }
    // RENDER POWERUPS
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i <powups.size(); i++) {
      Powerup pu = powups.get(i);
      if (pu.intersect(s1) && pu.type == 'h') {
        //remove power up
        powups.remove(pu);
        // health benifit
        s1.health += 10;
      } else if (pu.intersect(s1) && pu.type == 'a') {
        s1.lazerCount += 100;
        powups.remove(pu);
        // more ammo
      } else if (pu.intersect(s1) && pu.type == 't') {
        s1.turretCount += 1;
        powups.remove(pu);
        // more ammo
      }
      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }
    // lazer strength

    // turret count
    // heat seeking ammo
    // time credit
    // remove all enemies on screen
    // temporary score multiplier
    // alter speed of enemy objects
    //rotating rock for melee damage
    // temp invinsibility



    //RENDER LAZERS AND DETECT ROCKS COLLIDE
    // if (keyPressed && key == ' ') {
    //lazers.add(new Lazer(s1.x, s1.y));
    for (int i = 0; i < lazers.size(); i++) {
      Lazer lazer= lazers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (lazer.intersect(rock)) {
          rock.diam -= 10;
          if (rock.diam <= 39) {
            rocks.remove(rock);
          }
          score += 100;
          lazers.remove(lazer);
        }
      }
      lazer.display();
      lazer.move();
      if (lazer.reachedTop()) {
        lazers.remove(lazer);
      }
    }


    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock= rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        // deduct 10 points
        score -= 10;
        // deduct 10 health
        s1.health -= 10;

        // delete the rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        score -= 2500;
        rocks.remove(rock);
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health<1) {
      gameOver();
      noLoop();
    }
  }
  s1.display();
  s1.move(mouseX, mouseY);
  infoPanel();
  if (score<0) {
    gameOver();
    noLoop();
  }
}
void keyPressed() {
  lazer.play();
  if (key == ' ' && s1.fire()) {
    lazers.add(new Lazer(s1.x, s1.y));
    s1.lazerCount--;
  
}
}
void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(35);
  textAlign(LEFT);
  text("Score: " + score, 20, 36);
  text("health: " + s1.health, 200, 36);
  text("level: " + level, 420, 36);
  text("Ammo: " + s1.lazerCount, 600, 36);
  textAlign(CENTER);
}

void startScreen() {
  background(0);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Welcome to SpaceGame!", width/2, 300);
  text("Made by: Jae Karppinen", width/2, 320);
  text("Note: If a rock hits the bottom you loose 2500 points from your score", width/2, 400);
  text("Please click mouse to start!", width/2, 340);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Game Over!", width/2, 300);
  text("Score:" + score, width/2, 320);
  text("Level:" + level, width/2, 340);
}

void ticker() {
}
void mousePressed() {
  lazer.play();
  //if (!laser.isPlaying()) {
  //laser.play();
  //}
  if (s1.fire()&& s1.turretCount == 1) {
    lazers.add(new Lazer(s1.x, s1.y));
    s1.lazerCount --;
  } else  if (s1.fire()&& s1.turretCount == 2) {
    lazers.add(new Lazer(s1.x-10, s1.y));
    lazers.add(new Lazer(s1.x+10, s1.y));
    s1.lazerCount --;
  } else  if (s1.fire()&& s1.turretCount == 3) {
    lazers.add(new Lazer(s1.x-15, s1.y));
    lazers.add(new Lazer(s1.x, s1.y));
    lazers.add(new Lazer(s1.x+15, s1.y));
    s1.lazerCount --;
  } else  if (s1.fire()&& s1.turretCount == 4) {
    lazers.add(new Lazer(s1.x-30, s1.y));
    lazers.add(new Lazer(s1.x-10, s1.y));
    lazers.add(new Lazer(s1.x+10, s1.y));
    lazers.add(new Lazer(s1.x+30, s1.y));
    s1.lazerCount --;
  } else if (s1.fire() && s1.turretCount > 4) {
    lazers.add(new Lazer(s1.x-30, s1.y));
    lazers.add(new Lazer(s1.x-10, s1.y));
    lazers.add(new Lazer(s1.x+10, s1.y));
    lazers.add(new Lazer(s1.x+30, s1.y));
    s1.lazerCount --;
  }
}
