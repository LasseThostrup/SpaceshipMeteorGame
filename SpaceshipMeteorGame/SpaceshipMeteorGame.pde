import java.util.Timer;
import java.util.TimerTask;

Meteors meteors;
Spaceship spaceship;
boolean gameOver = false;
boolean levelActive = false;
int hitbox = 20;
int level = 1;

void setup() {
  size(1024,600,P3D);
  background(255);
  frameRate(50);
  meteors = new Meteors();
  spaceship = new Spaceship(width/2, height/2);
}

void draw() {
  if (gameOver) {
    clear();
    translate(width/2-200, height/2-40);
    textSize(64);
    fill(255, 0, 0);
    text("GAME OVER", 10, 30);
  }
  else {
    
    if (levelActive) {
      //Current level is active
      meteorSpaceshipCollision();
      clear();
      
      if (key == 'm') {
        meteors.newMeteor();
      }
      
      spaceship.drawSpaceship();
      
      meteors.drawMeteors();
      
      //Insert some detection when level is done
        //Increment level variable
      
      
    }
    else {
       //Count down to next level
       
       
       levelActive = true;
    }
  }
}

void meteorSpaceshipCollision() {
  for (Meteor meteor : meteors.meteors) {
    if (meteor.z > 450-hitbox && abs(meteor.x-spaceship.x) < hitbox && abs(meteor.y-spaceship.y) < hitbox) gameOver = true;
  }
}

void newLevel() {
  

}