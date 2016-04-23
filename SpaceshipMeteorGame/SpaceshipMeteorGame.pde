import java.util.Timer;
import java.util.TimerTask;

Meteors meteors;
Spaceship spaceship;
boolean gameOver = false;
boolean levelActive = false;
int hitbox = 20;
int level = 1;
private static final byte countdown = 5;
private static int seconds, startTime;
String[] backgrounds = {"Planet-ring-asteroids.jpg", "Earth-view copy.jpg", "deep-blue-space.jpg"};
PImage background;

void setup() {
  size(1440, 900, P3D);
  //fullScreen(P3D);
  frameRate(100);
  meteors = new Meteors();
  spaceship = new Spaceship(width/2, height/2, 650, 5, 1);
  
  startTime = millis()/1000 + countdown;
  background = loadImage(backgrounds[0]);
}

void draw() {
  if (gameOver) {
    clear();
    translate(width/2-200, height/2-40);
    textSize(64);
    fill(255, 0, 0);
    text("GAME OVER", 10, 30);
    
    //Insert text menu to start new game
  }
  else {
    
    if (levelActive) {
      //Current level is active
      meteorSpaceshipCollision();
      clear();
      
      if (key == 'm') {
        meteors.newMeteor();
      }
      background(background);
      spaceship.drawSpaceship(broken);
      
      meteors.drawMeteors();
      
      //Insert some detection when level is done
        //Increment level variable
      seconds = startTime - millis()/1000;
      
      if (seconds < 0) {
        newLevel();
      }
      else {
        pushMatrix();
        textSize(48);
        translate(0, 10);
        fill(255, 0, 0);
        text(seconds, 80, 80);
        popMatrix();
      }
    }
    else {
      seconds = startTime - millis()/1000;
      
      if (seconds < 0) {
        levelActive = true;
        startTime = millis()/1000 + 20;
        meteors.spawnMeteors(level);
      }
      else {
        clear();
        pushMatrix();
        textSize(64);
        translate(width/2-350, height/2-200);
        text("Level " + level + " will start in:", 80, 80);
        translate(250, 150);
        fill(255, 0, 0);
        text(seconds, 80, 80);
        popMatrix();
      };
    }
  }
}

void meteorSpaceshipCollision() {
  for (Meteor meteor : meteors.meteors) {
    if (meteor.z > 650-hitbox && abs(meteor.x-spaceship.x) < hitbox && abs(meteor.y-spaceship.y) < hitbox) gameOver = true;
  }
}

void newLevel() {
  //Create a new timer that shows seconds left in current level
  level++;
  levelActive=false;
  startTime = millis()/1000 + 3;
  meteors.clearMeteors();
  spaceship.x = width/2;
  spaceship.y = height/2;
  
  background = loadImage(backgrounds[(level-1)%3]);

}