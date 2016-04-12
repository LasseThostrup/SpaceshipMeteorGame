// Declare and construct two objects (h1, h2) from the class Ship 
Ship h1 = new Ship(width/2, height/2, 100, 100); 

boolean[] keys;
 
 float x, y, z, movementSpeed=8, rotateSpeed=1;
 float theta=0;
 float angle=0;
 float thetaReturn=0;
 float angleReturn=0;
void setup() 
{
  x=width/2;
  y=height/2;
  z=100;
  size(1400, 800, P3D);
}

void draw() {
  background(204);
  h1.drawShip(x, y, z, theta, angle);
  if (keyPressed==true) { 
    if (keys[0]) {
      x -= movementSpeed;
      theta+=rotateSpeed;
    }
    else if (keys[1]) {
      x += movementSpeed;
      theta-=rotateSpeed;
    }
    else if (keys[2]) {
      y -= movementSpeed;
      angle-=rotateSpeed;
    }
    else if (keys[3]) {
      y += movementSpeed;
      angle+=rotateSpeed;
    }
    //////////////////////////////////////////
    else if(keys[4]){
      theta-=rotateSpeed;
    }
    else if(keys[5]){
      theta+=rotateSpeed;
    }
    else if(keys[6]){
      angle+=rotateSpeed;
    }
    else if(keys[7]){
      angle-=rotateSpeed;
    }
  }
    
    println("Theta: ",theta, ", Angle: ", angle);
 
} 

void keyPressed(){
  if (keyCode == LEFT) {
      keys[0]=true;
    }
    else if (keyCode == RIGHT) {
      keys[1]=true;
    }
    /*
    else if (keyCode == UP) {
      keys[2]=true;
    }
    else if (keyCode == DOWN) {
      keys[3]=true;
    }
    /*
    else if(key == 'a'){
      keys[4]=true;
    }
    else if(key == 'd'){
       keys[5]=true;
    }
    else if(key=='w'){
      keys[6]=true;
    }
    else if(key=='s'){
      keys[7]=true;
    }*/
}

void keyReleased(){
  if (keyCode == LEFT) {
      keys[0]=false;
    }
    else if (keyCode == RIGHT) {
      keys[1]=false;
    }
    /*
    else if (keyCode == UP) {
      keys[2]=false;
    }
    else if (keyCode == DOWN) {
      keys[3]=false;
    }
    /*
    else if(key == 'a'){
      keys[4]=false;
    }
    else if(key == 'd'){
       keys[5]=false;
    }
    else if(key=='w'){
      keys[6]=false;
    }
    else if(key=='s'){
      keys[7]=false;
    } */
}
 