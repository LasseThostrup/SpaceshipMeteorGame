class Ship { 
  float x, y, z, size;
  Ship (float x1, float y1, float z1, float size) {  
    x=x1;
    y=y1;
    z=z1;
    this.size=size;
  } 
  void drawShip(float x, float y, float z, float theta, float angle) { 
    
    translate(x, y, z);
    rotateY(radians(theta));
    rotateX(radians(angle));
    pushMatrix();
    fill(50, 60, 170);
    box(size);
    popMatrix();
  
    
    pushMatrix();
    fill(200);
    translate(80, 0, 0);
    box(60, 5, 100);
    popMatrix();
   
    pushMatrix();
    translate(-80, 0, 0);
    box(60, 5, 100);
    popMatrix();
  } 

}