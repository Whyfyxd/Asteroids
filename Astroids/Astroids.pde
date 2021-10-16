boolean upKey, downKey, leftKey, rightKey, spaceKey;
Ship myShip;
ArrayList<GameObject> myObjects;
int mode;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;
final int WIN = 4;

void setup() {
  size (800, 800);
  mode = INTRO;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  myObjects = new ArrayList<GameObject>();
  myShip = new Ship();

    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(myShip);
}

void draw() {
  background(0);

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == WIN) {
    Win();
  } else {
    println("error: Mode = " + mode);
  }
}

void keyPressed() {
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == ' ') spaceKey = true;
}

void keyReleased() {
  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == ' ') spaceKey = false;
}
