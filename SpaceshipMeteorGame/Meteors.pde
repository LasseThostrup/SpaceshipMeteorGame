import java.util.Random;
import java.util.Iterator;

class Meteors {
  float speed = 1.5; //Movement speed of meteors
  public ArrayList<Meteor> meteors;
  Random random;
  Boolean gameOver = false;
  
  Meteors() {
    meteors = new ArrayList<Meteor>();
    random = new Random();
  }

  void drawMeteors() {
    Boolean hasDeletedAMeteor = false;
    for (Iterator<Meteor> iterator = meteors.iterator(); iterator.hasNext();) {
      Meteor meteor = iterator.next();
      if (meteor.z > 680) {
          // Remove the meteor because it hit max z
          iterator.remove();
          hasDeletedAMeteor = true;
      }
      meteor.drawMeteor(speed);
    }
    if (hasDeletedAMeteor) {
      //Spawn a new meteor
      newMeteor();
    }
  }  
  
  void newMeteor() {
    float x = random.nextFloat()*width/4+width/2-width/8;
    float y = random.nextFloat()*height/4+height/2-height/8;
    float z = random.nextFloat()*250; //Values between 0 and 250
    meteors.add(new Meteor(x, y, z));
  } //<>// //<>//
  
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
}
  