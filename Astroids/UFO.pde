class UFO extends GameObject{
  //UFO code

  UFO() {
    lives = 1;
    location = new PVector (random(0, width), 0);
    velocity = new PVector (0, 1);
    size = 45;
  }
  void show() {
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
    ellipse(location.x, location.y, size/2, size/2);
  }
  void act() {
    location.add (velocity);
    
    if (location.y < -50)       lives = 0;
    if (location.y > height+50) lives = 0;
    if (location.x < -50)       lives = 0;
    if (location.x > width+50)  lives = 0;

    //ship collision code and screen flash code
    if (myShip.inv >= myShip.invThresh) {
      if (dist(myShip.location.x, myShip.location.y, location.x, location.y) <= size/2 + myShip.size/2) {
        myShip.lives -= 1;
        myShip.inv = 0;
        background(255, 0, 0);
      }
    }

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives = 0;
        }
      }
      i++;
    }
  }
}
