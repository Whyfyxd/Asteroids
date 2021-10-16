class Particle extends GameObject {
  //particle code

  int t;
  float vxr, vyr;

  Particle(float x, float y) {
    lives = 1;
    vxr = random (-10, 10);
    vyr = random (-10, 10);
    size = int(random(5, 12));
    t = int(random(200, 255));
    location = new PVector (x, y);
    velocity = new PVector (vxr, vyr);
    velocity.rotate(PI+random(-0.5, 0.5));
    velocity.setMag(3);
  }

  void show() {
    noStroke();
    fill(255, 255, 255, t);
    circle (location.x, location.y, size);
  }

  void act() {
    super.act();

    //particle decay code
    t -= 7;
    if (t<=0) {
      lives = 0;
    }
  }
}
