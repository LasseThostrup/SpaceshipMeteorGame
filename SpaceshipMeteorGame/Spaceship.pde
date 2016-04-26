
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
boolean broken=false;       //x key
float[] Xdirections = new float[4];
float[] Ydirections = new float[4];
float[] Xangles = new float[4];
float[] Yangles = new float[4];
float[] xRands = new float[4];
float[] yRands = new float[4];


class Spaceship { 
  float x, y, z, movementSpeed, rotateSpeed;
  float xAngle=0;
  float yAngle=0;
  float zAngle=0;
  float theta=0;
  float r=0, d=0;
  float l=0, u=0;
  float scale = .12;
 
  Spaceship(float x1, float y1, float z1, float movementSpeed1, float rotateSpeed1){
    x=x1;
    y=y1;
    z=z1;
    movementSpeed=movementSpeed1;
    rotateSpeed=rotateSpeed1;
  }
  
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }


  void drawSpaceship(boolean broken) { 
    //println("x: ", x, " y: ", y, " moveSpeed: ", movementSpeed, " rotateSpeed: ", rotateSpeed);
     //DO A BARREL ROLL 
    if(up==true | down==true | right==true | left==true)
        key_pressed=true;
  if(!broken){
   if(key_pressed==true){ 
   if (left) { //LEFT
        if(x>610){
          x -= movementSpeed;
          if(xAngle<26)
            xAngle+=6;
        }
      }
      else if(left==false){
          if(xAngle>0)
            xAngle-=3;
      }
      
      if (right) {  //RIGHT
        if(x<width-610){
            x += movementSpeed;
             if(xAngle>-26)
                xAngle-=6;
          }
      }
       else if(right==false){
           if(xAngle<0)
             xAngle+=3;
       }
       
       if (up) {  //UP
         if(y>380){
            y -= movementSpeed;
            if(yAngle>-20)
              yAngle-=6;
            
          }
        }
        else if(!up){
           if(yAngle<0)
              yAngle+=3;
        }
        
       if (down) {  //DOWN
         if(y<height-380){
            y += movementSpeed;
            if(yAngle<20)
              yAngle+=6;
           
          }
        }
        else if(!down){
          if(yAngle>0)
            yAngle-=3;
        }  
    }
    else{
      if(xAngle>0)  //was pointing left, bringing it back to pointing normal
          xAngle-=4;
      if(xAngle<0)  //was pointing right, bringing it back to pointing normal
          xAngle+=4;
      if(yAngle>0)  //was pointing down, bringing it back to pointing normal
          yAngle-=4;
      if(yAngle<0)  //was pointing up, bringing it back to pointing normal
          yAngle+=4;
      //zAngle=0;
      
    }
    
      
    if(barrelRoll==true){
        if(zAngle<360)
          zAngle+=30;
        else{
          zAngle=0;
          barrelRoll=false;
        }
     }  
    drawShip(x, y, z, xAngle, yAngle, zAngle, scale);
  }
  else if(broken){
    drawShip(x, y, z, xAngle, yAngle, zAngle, scale);
    for(int i=0; i<4; i++){
      Xdirections[i]+=xRands[i];
      Ydirections[i]+=yRands[i];
      Xangles[i]+=2*xRands[i];
      Yangles[i]+=2*yRands[i];
    }
    
  }

  } 
   
   void drawShip(float x, float y, float z, float xAngle, float yAngle, float zAngle, float scale){
     fill(255);
    drawNose(x+Xdirections[0], y+Ydirections[0], z, xAngle+Xangles[0], yAngle+Yangles[0], zAngle, scale);
    drawBody(x+Xdirections[1], y+Ydirections[1], z, xAngle+Xangles[1], yAngle+Yangles[1], zAngle, scale);
    drawLeftWing(x+Xdirections[2], y+Ydirections[2], z, xAngle+Xangles[2], yAngle+Yangles[2], zAngle, scale);
    drawRightWing(x+Xdirections[3], y+Ydirections[3], z, xAngle+Xangles[3], yAngle+Yangles[3], zAngle, scale);
  }
}

void drawNose(float x, float y, float z, float xAngle, float yAngle, float zAngle, float scale){
    pushMatrix();
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle));
    
    beginShape(TRIANGLES);
    //fill(200, 200, 255);    //BLUE
    vertex(scale*-40, scale*-20, scale*00);
    vertex(scale*40, scale*-20, scale*00);
    vertex(scale*0, scale*0, scale*-150);
    
    //fill(255, 200, 200);    //PINK
    vertex(scale*40,scale* -20, scale*00);
    vertex(scale*40, scale*20, scale*00);
    vertex(scale*0, scale*0, scale*-150);
    
    //fill(200, 255, 200);    //GREEN
    vertex(scale*40, scale*20, scale*00);
    vertex(scale*-40, scale*20, scale*00);
    vertex(scale*0, scale*0, scale*-150);
    
    //fill(200, 55, 200);  //PURPLE
    vertex(scale*-40, scale*20, scale*00);
    vertex(scale*-40, scale*-20, scale*00);
    vertex(scale*0, scale*0, scale*-150);
    endShape(); 
    popMatrix();
  }
  
void drawBody(float x, float y, float z, float xAngle, float yAngle, float zAngle, float scale){
  pushMatrix();
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle));
  beginShape(QUAD);
    //fill(200, 200, 255);    //BLUE
    vertex(scale*(-40), scale*(-20), scale*00);
    vertex(scale*(40), scale*(-20), scale*00);
    vertex(scale*(40), scale*(-20), scale*100);
    vertex(scale*(-40), scale*(-20), scale*100);
    
    //fill(255, 200, 200);    //PINK
    vertex(scale*40, scale*-20, scale*00);
    vertex(scale*40, scale*20, scale*00);
    vertex(scale*40, scale*20, scale*100);
    vertex(scale*40, scale*-20, scale*100);
    
    //fill(200, 255, 200);    //GREEN
    vertex(scale*40, scale*20, scale*00);
    vertex(scale*-40, scale*20, scale*00);
    vertex(scale*-40, scale*20, scale*100);
    vertex(scale*40, scale*20, scale*100);
    
    //fill(200, 55, 200);  //PURPLE
    vertex(scale*-40, scale*20, scale*00);
    vertex(scale*-40, scale*-20, scale*00);
    vertex(scale*-40, scale*-20, scale*100);
    vertex(scale*-40, scale*20, scale*100);
    endShape();
    
    //COCKPIT OF SHIP
    beginShape(QUAD);
    
    //fill(150);
    vertex(scale*-40, scale*-20, scale*100);
    vertex(scale*40, scale*-20, scale*100);
    vertex(scale*25, scale*-50, scale*100);
    vertex(scale*-25, scale*-50, scale*100);
    
    //fill(150, 150);
    vertex(scale*25, scale*-50, scale*100);
    vertex(scale*-25, scale*-50, scale*100);
    vertex(scale*-20, scale*-20, scale*0);
    vertex(scale*20, scale*-20, scale*0);
    
    vertex(scale*25, scale*-50, scale*100);
    vertex(scale*40, scale*-20, scale*100);
    vertex(scale*40, scale*-20, scale*0);
    vertex(scale*20, scale*-20, scale*0);
    
    vertex(scale*-25, scale*-50, scale*100);
    vertex(scale*-40, scale*-20, scale*100);
    vertex(scale*-40, scale*-20, scale*0);
    vertex(scale*-20, scale*-20, scale*0);
    
    //BACK OF SHIP
    //fill(150);
    vertex(scale*-40, scale*-20, scale*100);
    vertex(scale*40, scale*-20, scale*100);
    vertex(scale*40, scale*20, scale*100);
    vertex(scale*-40, scale*20, scale*100);
    endShape();   
    popMatrix();
}

void drawRightWing(float x, float y, float z, float xAngle, float yAngle, float zAngle, float scale){
    pushMatrix();
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle)); 
  
    //RIGHT WING
    beginShape(QUAD);
    //fill(255);
    vertex(scale*40, scale*0, scale*100);
    vertex(scale*40, scale*20, scale*100);
    vertex(scale*65, scale*20, scale*140);
    vertex(scale*65, scale*10, scale*140);
    
    vertex(scale*40, scale*0, scale*100);
    vertex(scale*100, scale*0, scale*100);
    vertex(scale*125, scale*10, scale*140);
    vertex(scale*65, scale*10, scale*140);
    
    vertex(scale*40, scale*20, scale*100);
    vertex(scale*100, scale*20, scale*100);
    vertex(scale*125, scale*20, scale*140);
    vertex(scale*65, scale*20, scale*140);
    endShape();
    
    beginShape(TRIANGLES);
    vertex(scale*40, scale*0, scale*25);
    vertex(scale*40, scale*0, scale*100);
    vertex(scale*100, scale*0, scale*100);
    
    vertex(scale*40, scale*20, scale*25);
    vertex(scale*40, scale*20, scale*100);
    vertex(scale*100, scale*20, scale*100);
    
    vertex(scale*65, scale*10, scale*140);
    vertex(scale*65, scale*20, scale*140);
    vertex(scale*140, scale*10, scale*160);////
    
    vertex(scale*65, scale*20, scale*140);
    vertex(scale*125, scale*20, scale*140);
    vertex(scale*140, scale*10, scale*160);//new point;
    
    vertex(scale*125, scale*20, scale*140);
    vertex(scale*125, scale*10, scale*140);
    vertex(scale*140, scale*10, scale*160);//new point;
    
    vertex(scale*125, scale*10, scale*140);
    vertex(scale*65, scale*10, scale*140);
    vertex(scale*140, scale*10, scale*160);//new point;
    endShape();
    popMatrix();
}
void drawLeftWing(float x, float y, float z, float xAngle, float yAngle, float zAngle, float scale){
    pushMatrix();
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle));  
  
    //LEFT WING
    beginShape(QUAD);
    //fill(255);
    vertex(scale*-40, scale*0, scale*100);
    vertex(scale*-40, scale*20, scale*100);
    vertex(scale*-65, scale*20, scale*140);
    vertex(scale*-65, scale*10, scale*140);
    
    vertex(scale*-40, scale*0, scale*100);
    vertex(scale*-100, scale*0, scale*100);
    vertex(scale*-125, scale*10, scale*140);
    vertex(scale*-65, scale*10, scale*140);
    
    vertex(scale*-40, scale*20, scale*100);
    vertex(scale*-100, scale*20, scale*100);
    vertex(scale*-125, scale*20, scale*140);
    vertex(scale*-65, scale*20, scale*140);
    endShape();
    
    beginShape(TRIANGLES);
    vertex(scale*-40, scale*0, scale*25);
    vertex(scale*-40, scale*0, scale*100);
    vertex(scale*-100, scale*0, scale*100);
    
    vertex(scale*-40, scale*20, scale*25);
    vertex(scale*-40, scale*20, scale*100);
    vertex(scale*-100, scale*20, scale*100);
    
    vertex(scale*-65, scale*10, scale*140);
    vertex(scale*-65, scale*20, scale*140);
    vertex(scale*-140, scale*10, scale*160);//// NEW POINT
    
    vertex(scale*-65, scale*20, scale*140);
    vertex(scale*-125, scale*20, scale*140);
    vertex(scale*-140, scale*10, scale*160);//new point;
    
    vertex(scale*-125, scale*20, scale*140);
    vertex(scale*-125, scale*10, scale*140);
    vertex(scale*-140, scale*10, scale*160);//new point;
    
    vertex(scale*-125, scale*10, scale*140);
    vertex(scale*-65, scale*10, scale*140);
    vertex(scale*-140, scale*10, scale*160);//new point;
    endShape();
    popMatrix();
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
    if(key=='x'){
      broken=true;
      for(int i=0; i<4; i++){
          xRands[i]=random(-2, 2);
          yRands[i]=random(-2, 2);
        }
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
 