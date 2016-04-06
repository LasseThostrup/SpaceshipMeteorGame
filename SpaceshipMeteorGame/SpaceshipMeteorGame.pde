float x,y,z;
Meteors meteors;
Spaceship spaceship;

void setup() {
  size(1024,600,P3D);
  background(255);
  meteors = new Meteors();
  spaceship = new Spaceship();
}

void draw() {
  clear();
  if (key == CODED) {
    if (keyCode == LEFT) {
      spaceship.moveLeft();
    }
    else if (keyCode == RIGHT) {
      spaceship.moveRight();
    }
    else if (keyCode == UP) {
      spaceship.moveUp();
    }
    else if (keyCode == DOWN) {
      spaceship.moveDown();
    }
  }
  spaceship.drawSpaceship();
}

void keyReleased() {
  keyCode = 0;
}