void gameover() {
  //gameover code

  background (0);
  textSize(125);
  fill (255, 255, 255);
  text ("GAMEOVER", 400, 250);

  //restart button
  fill (255, 255, 255);
  stroke(0);
  rect (400, 560, 300, 100);
  fill (0, 0, 0);
  textSize (75);
  text ("restart", 400, 545);
}
void gameoverClicks() {
  //restart button code and game reset code
  if (mouseX > 200 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    myObjects.clear();
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myShip.lives = 3;
    myShip.velocity = new PVector (0, 0);
    myShip.direction = new PVector (0, -0.1);
    myShip.location = new PVector (width/2, height/2);
    myShip.inv = 0;
    myObjects.add(myShip);
    mode = INTRO;
  }
}
