//tried to use an array for this but it would not work 
boolean up=false;
boolean down=false;
boolean right =false;
boolean left=false; 
boolean barrelRoll=false;
boolean key_pressed=false;

class Spaceship{
  
  int speed = 2; //Speed with which the Spaceship moves with
  float x, y, z = 450;
  float movementSpeed = 2, rotateSpeed = 1;
  float xAngle=0;
  float yAngle=0;
  float zAngle=0;
  float scaling = 0.1;
 

  
  Spaceship(){
    x=width/2;
    y=height/2;
  }
  Spaceship(float x1, float y1, float z1, float movementSpeed1, float rotateSpeed1){
    x=x1;
    y=y1;
    z=z1;
    movementSpeed=movementSpeed1;
    rotateSpeed=rotateSpeed1;
  }
  Spaceship(float x1, float y1){
    x=x1;
    y=y1;
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
    //println("x: ", x, " y: ", y, " moveSpeed: ", movementSpeed, " rotateSpeed: ", rotateSpeed);
    if(up==true | down==true | right==true | left==true)
        key_pressed=true;
  
    if(key_pressed){
      if (left) { //LEFT
        if(x>150){
          x -= movementSpeed;
          if(xAngle<26)
            xAngle+=4;
        }
      }
      else if(left==false){
          if(xAngle>0)
            xAngle-=2;
      }
      
      if (right) {  //RIGHT
        if(x<width-150){
            x += movementSpeed;
             if(xAngle>-26)
                xAngle-=4;
          }
      }
       else if(right==false){
           if(xAngle<0)
             xAngle+=2;
       }
       
       if (up) {  //UP
         if(y>100){
            y -= movementSpeed;
            if(yAngle>-20)
              yAngle-=4;
            
          }
        }
        else if(!up){
           if(yAngle<0)
              yAngle+=2;
        }
        
       if (down) {  //DOWN
         if(y<height-100){
            y += movementSpeed;
            if(yAngle<20)
              yAngle+=4;
           
          }
        }
        else if(!down){
          if(yAngle>0)
            yAngle-=2;
        }  
    }
    else{
      if(xAngle>0)  //was pointing left, bringing it back to pointing normal
          xAngle-=2;
      if(xAngle<0)  //was pointing right, bringing it back to pointing normal
          xAngle+=2;
      if(yAngle>0)  //was pointing down, bringing it back to pointing normal
          yAngle-=2;
      if(yAngle<0)  //was pointing up, bringing it back to pointing normal
          yAngle+=2;
    }
    

   //DO A BARREL ROLL 
     if(barrelRoll==true){
          if(zAngle<360)
            zAngle+=30;
          else if(zAngle>30){
            zAngle=0;
            barrelRoll=false;
          }
     }
  
    pushMatrix();
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle));
    /*
     beginShape(TRIANGLES);
    fill(200, 200, 255);
    vertex(50, 50, 50);
    vertex(-50, 50, 50);
    vertex(0, 0, 0);
    
    fill(255, 200, 200);
    vertex(-50, -50, 50);
    vertex(-50, +50, 50);
    vertex(0, 0, 0);
    
    fill(200, 255, 200);
    vertex(-50, -50, 50);
    vertex(+50, -50, 50);
    vertex(0, 0, 0);
    
    fill(200, 55, 200);
    vertex(+50, +50, 50);
    vertex(+50, -50, 50);
    vertex(0, 0, 0);
    endShape(); 
    */
    
    pushMatrix();
    fill(50,60, 170);
    //noFill();
    box(100*scaling);
    //box(50, 50, 200);
    popMatrix();
  
    
    pushMatrix();
    fill(200);
    translate(80*scaling, 0, 0);
    box(60*scaling, 5*scaling, 100*scaling);
    popMatrix();
   
    pushMatrix();
    translate(-80*scaling, 0, 0);
    box(60*scaling, 5*scaling, 100*scaling);
    popMatrix();
    
    popMatrix();
    
    //println("width: ",width, ", height: ", height);
  } 
}



void keyPressed(){
  
   if (keyCode == LEFT) {
      left=true;
    }
   if (keyCode == RIGHT) {
      right=true;
    }
    if (keyCode == UP) {
      up=true;
    }
    if (keyCode == DOWN) {
      down=true;
    }
    if(key=='b'){
      barrelRoll=true;
    }
  
}

void keyReleased(){
  key_pressed=false;
  
  if (keyCode == LEFT) {
      left=false;
    }
    if (keyCode == RIGHT) {
      right=false;
    }
    
    if (keyCode == UP) {
      up=false;
    }
    if (keyCode == DOWN) {
      down=false;
    } 
}