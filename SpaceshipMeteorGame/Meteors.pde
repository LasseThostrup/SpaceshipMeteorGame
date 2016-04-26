import java.util.Random;
import java.util.Iterator;

class Meteors {
  float speed = 1.5; //Movement speed of meteors
  public ArrayList<Meteor> meteors;
  Random random;
  Boolean gameOver = false;
  
  
  //variable for the sphere with texture
  int ptsW, ptsH;
  
  PImage img;
  
  int numPointsW;
  int numPointsH_2pi; 
  int numPointsH;
  
  float[] coorX;
  float[] coorY;
  float[] coorZ;
  float[] multXZ;
  
  
  Meteors() {
    meteors = new ArrayList<Meteor>();
    random = new Random();
    initializeSphere(15, 15);
    img = loadImage("meteorTexture.jpg");
  }

  void drawMeteors() {
    int hasDeletedAMeteor = 0;
    for (Iterator<Meteor> iterator = meteors.iterator(); iterator.hasNext();) {
      Meteor meteor = iterator.next();
      if (meteor.z > 680) {
          // Remove the meteor because it hit max z
          iterator.remove();
          hasDeletedAMeteor++;
      }
      meteor.drawMeteor(speed);
    }
    for (int i = 0; i < hasDeletedAMeteor; i++) {
      //Spawn a new meteor
      newMeteor();
    }
  }  
  
  void newMeteor() {
    float x = random.nextFloat()*width/4+width/2-width/8;
    float y = random.nextFloat()*height/4+height/2-height/8;
    float z = random.nextFloat()*250; //Values between 0 and 250
    meteors.add(new Meteor(x, y, z-100, img, ptsW, ptsH, numPointsW, numPointsH_2pi, numPointsH, coorX, coorY, coorZ, multXZ));
  } //<>//
  
  void clearMeteors() {
     meteors.clear();
  }
  
  void spawnMeteors(int level) {
    speed += (float)level*0.2;
    int meteorsCount = 20+(int)(20*(float)level*0.2);
    for (int i = 0; i < meteorsCount; i++) {
      newMeteor();
    }
    println("Meteor count: " + meteorsCount);
    println("Speed: " + speed);
  }
  
  void initializeSphere(int numPtsW, int numPtsH_2pi) {
  
    // The number of points around the width and height
    numPointsW=numPtsW+1;
    numPointsH_2pi=numPtsH_2pi;  // How many actual pts around the sphere (not just from top to bottom)
    numPointsH=ceil((float)numPointsH_2pi/2)+1;  // How many pts from top to bottom (abs(....) b/c of the possibility of an odd numPointsH_2pi)
  
    coorX=new float[numPointsW];   // All the x-coor in a horizontal circle radius 1
    coorY=new float[numPointsH];   // All the y-coor in a vertical circle radius 1
    coorZ=new float[numPointsW];   // All the z-coor in a horizontal circle radius 1
    multXZ=new float[numPointsH];  // The radius of each horizontal circle (that you will multiply with coorX and coorZ)
  
    for (int i=0; i<numPointsW ;i++) {  // For all the points around the width
      float thetaW=i*2*PI/(numPointsW-1);
      coorX[i]=sin(thetaW);
      coorZ[i]=cos(thetaW);
    }
    
    for (int i=0; i<numPointsH; i++) {  // For all points from top to bottom
      if (int(numPointsH_2pi/2) != (float)numPointsH_2pi/2 && i==numPointsH-1) {  // If the numPointsH_2pi is odd and it is at the last pt
        float thetaH=(i-1)*2*PI/(numPointsH_2pi);
        coorY[i]=cos(PI+thetaH); 
        multXZ[i]=0;
      } 
      else {
        //The numPointsH_2pi and 2 below allows there to be a flat bottom if the numPointsH is odd
        float thetaH=i*2*PI/(numPointsH_2pi);
  
        //PI+ below makes the top always the point instead of the bottom.
        coorY[i]=cos(PI+thetaH); 
        multXZ[i]=sin(thetaH);
      }
    }
  }
}

  