float x,y,z;

int movementSpeed = 8;

int rectWidth;
void setup() {
  size(1024,600,P3D);
  background(0);
  x = width/2;
  y = height/2;
  z = 100;
}

void draw() {
  clear();
  if (key == CODED) {
    if (keyCode == LEFT) {
      x -= movementSpeed;
    }
    else if (keyCode == RIGHT) {
      x += movementSpeed;    
    }
    else if (keyCode == UP) {
      y -= movementSpeed;
    }
    else if (keyCode == DOWN) {
      y += movementSpeed;
    }
  }
  translate(x,y,z);
  box(100);
}

void keyReleased() {
  keyCode = 0;
}