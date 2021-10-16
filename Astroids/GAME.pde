void game() {

  //life display
  fill(0);
  stroke(255);
  strokeWeight(4);
  if (myShip.lives == 3) {
    ellipse (100, 50, 20, 20);
    ellipse (130, 50, 20, 20);
    ellipse (160, 50, 20, 20);
  } else if (myShip.lives == 2) {
    ellipse (100, 50, 20, 20);
    ellipse (130, 50, 20, 20);
  } else {
    ellipse (100, 50, 20, 20);
  }

  //pause button
  stroke(0);
  strokeWeight(4);
  fill (255, 255, 255);
  rect (50, 50, 50, 50);
  line (40, 40, 40, 60);
  line (60, 40, 60, 60);
  stroke(255, 255, 255);
  strokeWeight(5);

  //remove objects code
  int i = 0;
  int j = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }

    //win condition code
    if (myObj instanceof Asteroid) {
      j++;
    }
  }
  //win condition checker
  if (j == 0) {
    mode = WIN;
  }
}



void gameClicks() {
  //pause button code
  if (mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 75) {
    mode = PAUSE;
  }
}
