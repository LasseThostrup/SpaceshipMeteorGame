int x, y, z;
int movementSpeed=8;
float theta=0;
float angle=0;

void setup(){
  size(1000, 600, P3D);
  x=width/2;
  y=height/2;
  z=100;
}

void draw(){
  clear();
  background(255, 200, 200);
  if (keyPressed==true) {
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
  
  translate(x, y, z); 
  //rotate(angle+=.1);
  //rotateY(angle+=.1);
  //rotateX(theta+=.1);
  //rotateZ(theta+=.1);

  //noFill();
  fill(150);
  box(100);
  
  fill(200);
  translate(80, 0, 0);
  box(60, 5, 100);
  
  translate(-160, 0, 0);
  box(60, 5, 100);
  
 }