
class Spaceship{
  public float x, y, z;
  int speed = 2; //Speed with which the Spaceship moves with
  
  Spaceship(){
    x = width/2;
    y = height/2;
    z = 450;
  }
  
  void moveLeft() { 
    if (x - speed > 0) 
      x -= speed; 
  }
  void moveRight() {     
    if (x + speed < width) 
      x += speed; 
  }
  void moveUp() { 
    if (y - speed > 0)
      y -= speed; 
  }
  void moveDown() { 
    if (y + speed < height)  
      y += speed; 
  }
  
  void drawSpaceship() {  
    if (key == CODED) {
      if (keyCode == LEFT) {
        moveLeft();
      }
      else if (keyCode == RIGHT) {
        moveRight();
      }
      else if (keyCode == UP) {
        moveUp();
      }
      else if (keyCode == DOWN) {
        moveDown();
      }
    }

    pushMatrix();
    translate(x,y,z);
    fill(150);
    box(10);
    popMatrix();
  }

}