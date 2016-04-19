 Ship ship = new Ship(700, 400, 100, 15, 4); // (x, y, z, movementSpeed, rotateSpeed)
PImage img; // = loadImage("deep-blue-space.jpg");
void setup(){
  //size(1400, 800, P3D);
  fullScreen(P3D);
  img = loadImage("deep-blue-space.jpg");
  frameRate(100);
  
  
}

void draw() {
  background(img);
  ship.drawShip();
  
  
  
} 