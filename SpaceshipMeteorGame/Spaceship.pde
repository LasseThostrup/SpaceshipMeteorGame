
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


class Spaceship { 
  float x, y, z, movementSpeed, rotateSpeed;
  float xAngle=0;
  float yAngle=0;
  float zAngle=0;
  float theta=0;
  float r=0, d=0;
  float l=0, u=0;
  
 

  
  Spaceship(){
    movementSpeed=8;
    rotateSpeed=1;
    x=width/2;
    y=height/2;
    z=100;
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

  void scatterSpaceship() {
     
  }

  void drawSpaceship() { 
    //println("x: ", x, " y: ", y, " moveSpeed: ", movementSpeed, " rotateSpeed: ", rotateSpeed);
     //DO A BARREL ROLL 
    if(up==true | down==true | right==true | left==true)
        key_pressed=true;
  
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
        /*
        if(zdown){
          zAngle+=2;
        }
        if(zup){
          zAngle-=2;
        }
        */
        if(Right)
          xAngle+=rotateSpeed;
         if(Left)
           xAngle-=rotateSpeed;
         if(Up)
           yAngle-=rotateSpeed;
          if(Down)
            yAngle+=rotateSpeed;
       
    
    
    drawShip(x, y, z, xAngle, yAngle, zAngle);

  } 
   
   void drawShip(float x, float y, float z, float xAngle, float yAngle, float zAngle){
    pushMatrix();
    translate(x, y, z);
    rotateZ(radians(zAngle));
    rotateY(radians(xAngle));
    rotateX(radians(yAngle));
  
  
    float scale=.12;
    ////////////////////////////DRAWING THE SHIP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   fill(204);
    //NOSE OF SHIP
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
    
    //BODY OF SHIP
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
    
    
    /*       //FIRE??
    if(r>18)
      r=10;
    if(d>15)
      d=7
    pushMatrix();
    rotate(radians(theta+=5));
    noStroke();
    beginShape(QUAD);
    fill(255, 50, 50); //RED
    vertex(scale*r++, 0, scale*102);
    vertex(0, scale*d++, scale*102);
    vertex(scale*-r, 0, scale*102);
    vertex(0, scale*-d, scale*102);
    endShape();
    popMatrix();
    
    if(u>14)
      u=5;
    if(l>13)
      l=4; 
    pushMatrix();
    rotate(radians(-theta));
    beginShape(QUAD);
    noStroke();
    fill(255, 250, 250); //WHITE
    vertex(scale*l++, 0, scale*103);
    vertex(0, scale*u++, scale*103);
    vertex(scale*-l, 0, scale*103);
    vertex(0, scale*-u, scale*103);
    endShape();
    popMatrix();
    */
    stroke(0);
    
    
    
    
    
    
    

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
 