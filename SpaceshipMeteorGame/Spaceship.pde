
class Spaceship{
  float x, y, z;
  int speed = 10; //Speed with which the Spaceship moves with
  
  Spaceship(){
    x = width/2;
    y = height/2;
    z = 50;
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
    translate(x,y,z);
    box(100);
  }

}