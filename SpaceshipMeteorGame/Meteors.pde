import java.util.Random;
import java.util.Iterator;

class Meteors {
  int speed = 10; //Movement speed of meteors
  public ArrayList<Meteor> meteors;
  Random random;
  Boolean gameOver = false;
  
  Meteors() {
    meteors = new ArrayList<Meteor>();
    random = new Random();
  }

  void drawMeteors() {
    for (Iterator<Meteor> iterator = meteors.iterator(); iterator.hasNext();) {
      Meteor meteor = iterator.next();
      if (meteor.z > 450) {
          // Remove the meteor because it hit max z
          iterator.remove();
      }
      meteor.drawMeteor();
    }
  }  
  
  void newMeteor() {
    float x = random.nextFloat()*width/4+width/2-width/8;
    float y = random.nextFloat()*height/4+height/2-height/8;
    meteors.add(new Meteor(x, y));
  } //<>//
}
  