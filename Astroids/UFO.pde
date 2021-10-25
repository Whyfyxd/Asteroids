class UFO extends GameObject {
  //UFO code
  int UFOtimer = 1019;
  int UFOspawn = 1020;
  int shotTimer, threshold;

  UFO() {
    lives = 1;
    location = new PVector (-20, -20);
    velocity = new PVector (0, 1);
    size = 45;
    shotTimer=0;
    threshold=180;
  }
  void show() {
    noFill();
    stroke(255);
    fill (#808080);
    ellipse(location.x, location.y, size, size);
    fill(#03a9f4);
    ellipse(location.x, location.y, size/2, size/2);
  }
  void act() {
    UFOtimer++;
    shotTimer++;

    if (UFOtimer == UFOspawn ) {
      int r = (int)(random(0, 4));

      if (r == 1) {
        location.y = 850;
        location.x = random(0, width);
        velocity.y = -1;
        velocity.x=0;
        UFOtimer=0;
      } else if (r ==2) {
        velocity.x = 1;
        velocity.y = 0;
        location.x = -50;
        location.y = random(0, height);
        UFOtimer=0;
      } else if (r == 3 ) {
        velocity.x = -1;
        velocity.y = 0;
        location.x = 850;
        location.y = random(0, height);
        UFOtimer=0;
        fill (255, 255, 255);
      } else if (r ==0) {
        velocity.x = 0;
        velocity.y = 1;
        location.x = random(0, width);
        location.y = -50;
        UFOtimer=0;
      }
    }
    location.add(velocity);

    //shooting
    if (shotTimer > threshold) {
      myObjects.add(new UFOBullet(location.x, location.y, myShip.location.x-location.x, myShip.location.y-location.y));
      shotTimer=0;
    }
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
