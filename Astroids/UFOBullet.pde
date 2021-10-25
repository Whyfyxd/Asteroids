class UFOBullet extends GameObject {
  //bullet code

  int timer;
  PVector nudge;

  UFOBullet(float x, float y, float vx, float vy) {
    timer = 85;
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (vx, vy);
    velocity.setMag(10);
    size = 10;
  }

  void show() {
    stroke (255);
    noFill ();
    ellipse (location.x, location.y, size, size);
  }

  void act() {
    super.act();

    //bullet decay code
    timer--;
    if (timer == 0) {
      lives=0;
    }
  }
}
