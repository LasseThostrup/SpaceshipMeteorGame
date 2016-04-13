Meteors meteors;
Spaceship spaceship;
Boolean gameOver = false;
int hitbox = 5;

void setup() {
  size(1024,600,P3D);
  background(255);
  frameRate(50);
  meteors = new Meteors();
  spaceship = new Spaceship();
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
    meteorSpaceshipCollision();
    clear();
    
    if (key == 'm') {
      meteors.newMeteor();
    }
    
    spaceship.drawSpaceship();
    
    meteors.drawMeteors();
  }
}

void keyReleased() {
  keyCode = 0;
}

void meteorSpaceshipCollision() {
  for (Meteor meteor : meteors.meteors) {
    if (meteor.z > 400 && abs(meteor.x-spaceship.x) < hitbox && abs(meteor.y-spaceship.y) < hitbox) gameOver = true;
  }
}