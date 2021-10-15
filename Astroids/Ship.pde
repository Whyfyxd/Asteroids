class Ship extends GameObject {

  //Instance variables

  PVector direction;
  int shotTimer, threshold, inv, invThresh;

  //Constructor(s)
  Ship() {
    lives = 3;
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    direction = new PVector (0, -0.1);
    shotTimer = 30;
    threshold = 30;
    size = 30;
    invThresh = 120;
    inv = 0;
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
    if (inv<=invThresh) {
      stroke (255, 0, 0);
      strokeWeight(5);
      circle (location.x, location.y, 60);
    }
    if (lives == 0) {
      mode = GAMEOVER;
    }
  }
}
