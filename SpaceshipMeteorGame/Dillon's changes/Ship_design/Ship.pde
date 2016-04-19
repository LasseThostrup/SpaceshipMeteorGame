float x, y, z, movementSpeed, rotateSpeed;
  float xAngle=0;
  float yAngle=0;
  float zAngle=0;
 
  //tried to use an array for this but it would not work 
  boolean up=false;
  boolean down=false;
  boolean right =false;
  boolean left=false; 
  boolean zdown=false;
  boolean zup=false;
  boolean Right=false;
  boolean Left=false;
  boolean Up=false;
  boolean Down=false;
  boolean test=false;
  boolean barrelRoll=false;
  boolean key_pressed=false;

class Ship { 
  
  Ship(){
    movementSpeed=8;
    rotateSpeed=1;
    x=width/2;
    y=height/2;
    z=100;
  }
  Ship(float x1, float y1, float z1, float movementSpeed1, float rotateSpeed1){
    x=x1;
    y=y1;
    z=z1;
    movementSpeed=movementSpeed1;
    rotateSpeed=rotateSpeed1;
  }
  Ship(float x1, float y1){
    x=x1;
    y=y1;
    z=100;
    movementSpeed=10;
    rotateSpeed=1;
  }
  
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }

  void drawShip() { 
    //println("x: ", x, " y: ", y, " moveSpeed: ", movementSpeed, " rotateSpeed: ", rotateSpeed);
    if(up==true | down==true | right==true | left==true)
        key_pressed=true;
  
   if(key_pressed==true){ 
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
    else if(test==true){
      if(xAngle>0)  //was pointing left, bringing it back to pointing normal
          xAngle-=2;
      if(xAngle<0)  //was pointing right, bringing it back to pointing normal
          xAngle+=2;
      if(yAngle>0)  //was pointing down, bringing it back to pointing normal
          yAngle-=2;
      if(yAngle<0)  //was pointing up, bringing it back to pointing normal
          yAngle+=2;
      zAngle=0;
      
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
        
        if(zdown){
          zAngle+=2;
        }
        if(zup){
          zAngle-=2;
        }
        if(Right)
          xAngle+=rotateSpeed;
         if(Left)
           xAngle-=rotateSpeed;
         if(Up)
           yAngle-=rotateSpeed;
          if(Down)
            yAngle+=rotateSpeed;
       
    
    
    drawShip3(x, y, z, xAngle, yAngle, zAngle);

  } 
  
  
  void drawShip1(float x, float y, float z, float xAngle, float yAngle, float zAngle){
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle));
  
 
    //noStroke();
    //fill(255, 200, 200);
    beginShape(TRIANGLES);
    //fill(200, 200, 255);    //BLUE
    vertex(0, -30, 00);
    vertex(60, 0, 00);
    vertex(0, 0, -150);
    
    //fill(255, 200, 200);    //PINK
    vertex(60, 0, 00);
    vertex(0, 30, 00);
    vertex(0, 0, -150);
    
    //fill(200, 255, 200);    //GREEN
    vertex(0, 30, 00);
    vertex(-60, 0, 00);
    vertex(0, 0, -150);
    
    //fill(200, 55, 200);  //PURPLE
    vertex(-60, 0, 00);
    vertex(0, -30, 00);
    vertex(0, 0, -150);
    endShape(); 
    
    beginShape(QUAD);    //Back of Ship
    //fill(150);
    vertex(0, -30, 00);
    vertex(60, 0, 00);
    vertex(0, 30, 00);
    vertex(-60, 0, 00);
    endShape();
    
    beginShape(QUAD);    //Right Wing
    //fill(255);
    vertex(60, 0, 0);
    vertex(90, 0, 0);
    vertex(90, 0, -30);
    vertex(30, 0, -75);
    endShape();
    
    beginShape(TRIANGLE);  //Right Wing tip
    vertex(90, 0, 0);
    vertex(105, 10, 0);
    vertex(90, 0, -30);
    endShape();
    
    beginShape(QUAD);    //Left Wing
    
    vertex(-60, 0, 0);
    vertex(-90, 0, 0);
    vertex(-90, 0, -30);
    vertex(-30, 0, -75);
    endShape();
    
    beginShape(TRIANGLE);  //Left Wing tip
    vertex(-90, 0, 0);
    vertex(-105, 10, 0);
    vertex(-90, 0, -30);
    endShape();

  }
  
   void drawShip2(float x, float y, float z, float xAngle, float yAngle, float zAngle){
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle));
    
    pushMatrix();
    //fill(50,60, 170);
    //no//fill();
    box(100);
    //box(50, 50, 200);
    popMatrix();

    pushMatrix();
    //fill(200);
    translate(80, 0, 0);
    box(60, 5, 100);
    popMatrix();
   
    pushMatrix();
    translate(-80, 0, 0);
    box(60, 5, 100);
    popMatrix();
     
   }
   
   void drawShip3(float x, float y, float z, float xAngle, float yAngle, float zAngle){
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle));
  
 
    //NOSE OF SHIP
    beginShape(TRIANGLES);
    //fill(200, 200, 255);    //BLUE
    vertex(-40, -20, 00);
    vertex(40, -20, 00);
    vertex(0, 0, -150);
    
    //fill(255, 200, 200);    //PINK
    vertex(40, -20, 00);
    vertex(40, 20, 00);
    vertex(0, 0, -150);
    
    //fill(200, 255, 200);    //GREEN
    vertex(40, 20, 00);
    vertex(-40, 20, 00);
    vertex(0, 0, -150);
    
    //fill(200, 55, 200);  //PURPLE
    vertex(-40, 20, 00);
    vertex(-40, -20, 00);
    vertex(0, 0, -150);
    endShape(); 
    
    //BODY OF SHIP
    beginShape(QUAD);
    //fill(200, 200, 255);    //BLUE
    vertex(-40, -20, 00);
    vertex(40, -20, 00);
    vertex(40, -20, 100);
    vertex(-40, -20, 100);
    
    //fill(255, 200, 200);    //PINK
    vertex(40, -20, 00);
    vertex(40, 20, 00);
    vertex(40, 20, 100);
    vertex(40, -20, 100);
    
    //fill(200, 255, 200);    //GREEN
    vertex(40, 20, 00);
    vertex(-40, 20, 00);
    vertex(-40, 20, 100);
    vertex(40, 20, 100);
    
    //fill(200, 55, 200);  //PURPLE
    vertex(-40, 20, 00);
    vertex(-40, -20, 00);
    vertex(-40, -20, 100);
    vertex(-40, 20, 100);
    endShape();
    
    //COCKPIT OF SHIP
    beginShape(QUAD);
    
    //fill(150);
    vertex(-40, -20, 100);
    vertex(40, -20, 100);
    vertex(25, -50, 100);
    vertex(-25, -50, 100);
    
    //fill(150, 150);
    vertex(25, -50, 100);
    vertex(-25, -50, 100);
    vertex(-20, -20, 0);
    vertex(20, -20, 0);
    
    vertex(25, -50, 100);
    vertex(40, -20, 100);
    vertex(40, -20, 0);
    vertex(20, -20, 0);
    
    vertex(-25, -50, 100);
    vertex(-40, -20, 100);
    vertex(-40, -20, 0);
    vertex(-20, -20, 0);
    
    //BACK OF SHIP
    //fill(150);
    vertex(-40, -20, 100);
    vertex(40, -20, 100);
    vertex(40, 20, 100);
    vertex(-40, 20, 100);
    endShape();
    
    //RIGHT WING
    beginShape(QUAD);
    //fill(255);
    vertex(40, 0, 100);
    vertex(40, 20, 100);
    vertex(65, 20, 140);
    vertex(65, 10, 140);
    
    vertex(40, 0, 100);
    vertex(100, 0, 100);
    vertex(125, 10, 140);
    vertex(65, 10, 140);
    
    vertex(40, 20, 100);
    vertex(100, 20, 100);
    vertex(125, 20, 140);
    vertex(65, 20, 140);
    endShape();
    
    beginShape(TRIANGLES);
    vertex(40, 0, 25);
    vertex(40, 0, 100);
    vertex(100, 0, 100);
    
    vertex(40, 20, 25);
    vertex(40, 20, 100);
    vertex(100, 20, 100);
    
    vertex(65, 10, 140);
    vertex(65, 20, 140);
    vertex(140, 10, 160);////
    
    vertex(65, 20, 140);
    vertex(125, 20, 140);
    vertex(140, 10, 160);//new point;
    
    vertex(125, 20, 140);
    vertex(125, 10, 140);
    vertex(140, 10, 160);//new point;
    
    vertex(125, 10, 140);
    vertex(65, 10, 140);
    vertex(140, 10, 160);//new point;
    endShape();
    
    //LEFT WING
    beginShape(QUAD);
    //fill(255);
    vertex(-40, 0, 100);
    vertex(-40, 20, 100);
    vertex(-65, 20, 140);
    vertex(-65, 10, 140);
    
    vertex(-40, 0, 100);
    vertex(-100, 0, 100);
    vertex(-125, 10, 140);
    vertex(-65, 10, 140);
    
    vertex(-40, 20, 100);
    vertex(-100, 20, 100);
    vertex(-125, 20, 140);
    vertex(-65, 20, 140);
    endShape();
    
    beginShape(TRIANGLES);
    vertex(-40, 0, 25);
    vertex(-40, 0, 100);
    vertex(-100, 0, 100);
    
    vertex(-40, 20, 25);
    vertex(-40, 20, 100);
    vertex(-100, 20, 100);
    
    vertex(-65, 10, 140);
    vertex(-65, 20, 140);
    vertex(-140, 10, 160);//// NEW POINT
    
    vertex(-65, 20, 140);
    vertex(-125, 20, 140);
    vertex(-140, 10, 160);//new point;
    
    vertex(-125, 20, 140);
    vertex(-125, 10, 140);
    vertex(-140, 10, 160);//new point;
    
    vertex(-125, 10, 140);
    vertex(-65, 10, 140);
    vertex(-140, 10, 160);//new point;
    endShape();
    
    
    
    
    

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
    if(key=='w'){
      zup=true;
    }
    if(key=='s'){
      zdown=true;
    }
    if(key=='j'){
      Left=true;
    }
    if(key=='l'){
      Right=true;
    }
    if(key=='i'){
      Up=true;
    }
    if(key=='k'){
      Down=true;
    }
    if(key=='t'){
      test=true;
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
    if(key=='w'){
      zup=false;
    }
    if(key=='s'){
      zdown=false;
    }
    if(key=='j'){
      Left=false;
    }
    if(key=='l'){
      Right=false;
    }
    if(key=='i'){
      Up=false;
    }
    if(key=='k'){
      Down=false;
    }
    if(key=='t'){
      test=false;
    }
    
}
 