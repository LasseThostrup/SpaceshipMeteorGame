
class Meteor {

  int ptsW, ptsH;
  
  PImage img;
  
  int numPointsW;
  int numPointsH_2pi; 
  int numPointsH;
  
  float[] coorX;
  float[] coorY;
  float[] coorZ;
  float[] multXZ;
  public float x, y, z;
  
  Meteor(float x, float y, float z, PImage img, int ptsW, int ptsH, int numPointsW, int numPointsH_2pi, int numPointsH, float[] coorX, float[] coorY, float[] coorZ, float[] multXZ) {
  
    this.img=img;
    this.ptsW=ptsW;
    this.ptsH=ptsH;
    
    this.x = x;
    this.y = y;
    this.z = z;
    
    this.numPointsW = numPointsW;
    this.numPointsH_2pi = numPointsH_2pi;
    this.numPointsH = numPointsH;
    
    this.coorX = coorX;
    this.coorY = coorY;
    this.coorZ = coorZ;
    this.multXZ = multXZ;
  }
  
  void drawMeteor(float speed) { 
    pushMatrix();
    z += speed;
    translate(x, y, z);
    textureSphere(10, 10, 10, img);
    popMatrix();
  }
  
  void scatterMeteor() {
    
  }
  
   
  
  void textureSphere(float rx, float ry, float rz, PImage t) { 
    // These are so we can map certain parts of the image on to the shape 
    float changeU=t.width/(float)(numPointsW-1); 
    float changeV=t.height/(float)(numPointsH-1); 
    float u=0;  // Width variable for the texture
    float v=0;  // Height variable for the texture
  
    beginShape(TRIANGLE_STRIP);
    texture(t);
    for (int i=0; i<(numPointsH-1); i++) {  // For all the rings but top and bottom
      // Goes into the array here instead of loop to save time
      float coory=coorY[i];
      float cooryPlus=coorY[i+1];
  
      float multxz=multXZ[i];
      float multxzPlus=multXZ[i+1];
  
      stroke(50, 50);
      for (int j=0; j<numPointsW; j++) { // For all the pts in the ring
        normal(-coorX[j]*multxz, -coory, -coorZ[j]*multxz);
        vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
        normal(-coorX[j]*multxzPlus, -cooryPlus, -coorZ[j]*multxzPlus);
        vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
        u+=changeU;
      }
      v+=changeV;
      u=0;
      
    }
    endShape();
  }
}