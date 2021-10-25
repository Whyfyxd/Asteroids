class Ship extends GameObject {

  //Instance variables

  PVector direction;
  int shotTimer, threshold, inv, invThresh, teleportTimer, teleportCooldown;

  //Constructor(s)
  Ship() {
    lives = 3;
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    direction = new PVector (0, -0.1);
    shotTimer = 30;
    threshold = 30;
    size = 30;
    invThresh = 180;
    inv = 0;
    teleportTimer = 299;
    teleportCooldown = 0;
  }

  //Behavior Functions
  void show() {
    pushMatrix ();
    translate (location.x, location.y);
    rotate (direction.heading());
    noFill ();
    stroke (255);
    triangle (-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
  }

  void act() {
    super.act();

    shotTimer++;
    inv++;
    teleportTimer++;

    //movement code
    if (upKey) {
      velocity.add(direction);
      myObjects.add (new Fire());
      myObjects.add (new Fire());
      myObjects.add (new Fire());
    }
    if (downKey)  velocity.sub(direction);
    if (leftKey)  direction.rotate(-radians(5));
    if (rightKey) direction.rotate(radians(5));
    if (spaceKey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }

    //invinceibility code
    if (inv<=invThresh) {
      stroke (255, 0, 0);
      strokeWeight(5);
      circle (location.x, location.y, 60);
    }
    //UFO collision code
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof UFOBullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives -=1;
          inv=0;
          background(255, 0, 0);
        }
      }
      i++;
    }
    //gameover transition code
    if (lives == 0) {
      mode = GAMEOVER;
    }
  }
}
