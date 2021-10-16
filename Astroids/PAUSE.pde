void pause() {
  //pause code

  //pause screen and resume button
  background (0);
  textSize(125);
  stroke(0);
  strokeWeight(4);
  fill (255, 255, 255);
  rect (50, 50, 50, 50);
  triangle (40, 35, 40, 65, 65, 50);
  fill (255, 255, 255);
  text ("PAUSED", 400, 250);
}
void pauseClicks() {
  //resume button code
  if (mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 75) {
    mode = GAME;
  }
}
