class Asteroid extends GameObject {
  //Asteroid code

  Asteroid() {
    lives = 1;

    location = new PVector (random(0, width), random(0, height));
    velocity = new PVector (0, 1);
    velocity.rotate (random (0, TWO_PI));
    size = 100;
  }

  Asteroid (int s, float x, float y) {
    lives = 1 ;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate (random (0, TWO_PI));
    size = s;
  }

  void show() {
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    //ship collision code and screen flash code
    if (myShip.inv >= myShip.invThresh) {
      if (dist(myShip.location.x, myShip.location.y, location.x, location.y) <= size/2 + myShip.size/2) {
        myShip.lives -= 1;
        myShip.inv = 0;
        background(255, 0, 0);
      }
    }

    //bullet collision code
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives = 0;
          if (size >=50) {
            //asteroid splitting code
            myObjects.add (new Asteroid(size/2, location.x, location.y));
            myObjects.add (new Asteroid(size/2, location.x, location.y));
            //explosion particles
            myObjects.add (new Particle(location.x, location.y));
            myObjects.add (new Particle(location.x, location.y));
            myObjects.add (new Particle(location.x, location.y));
            myObjects.add (new Particle(location.x, location.y));
            myObjects.add (new Particle(location.x, location.y));
            myObjects.add (new Particle(location.x, location.y));
            myObjects.add (new Particle(location.x, location.y));
          }
          //explosion particles
          myObjects.add (new Particle(location.x, location.y));
          myObjects.add (new Particle(location.x, location.y));
          myObjects.add (new Particle(location.x, location.y));
          myObjects.add (new Particle(location.x, location.y));
          myObjects.add (new Particle(location.x, location.y));
          myObjects.add (new Particle(location.x, location.y));
          myObjects.add (new Particle(location.x, location.y));
        }
      }
      i++;
    }
  }
}
