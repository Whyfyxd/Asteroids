void intro() {
  //intro code

  //start screen
  fill (255, 255, 255);
  rect (400, 560, 200, 100);
  fill (0, 0, 0);
  textSize (75);
  text ("start", 400, 545);
  textSize (100);
  fill (255, 255, 255);
  text ("Asteroids", 400, 250);
}

void introClicks() {
  //start button code
  if (mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
  }
}
