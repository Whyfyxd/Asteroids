boolean upKey, downKey, leftKey, rightKey, spaceKey, teleport;
Ship myShip;
ArrayList<GameObject> myObjects;
int mode;
int t = 1;

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

  t++;
  
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game(t);
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == WIN) {
    Win();
  } else {
    println("error: Mode = " + mode);
  }
  int i =0;
  int a = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    if (myObj instanceof UFO) {
      a++;
    }
    i++;
  }
  if (a==0 && t>350) {
   t=0; 
  }

}

void keyPressed() {
  if (keyCode == UP)    upKey = true;
  if (keyCode == DOWN)  downKey = true;
  if (keyCode == LEFT)  leftKey = true;
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == ' ')   spaceKey = true;
  if (keyCode == 'v')   teleport = true;
}

void keyReleased() {
  if (keyCode == UP)    upKey = false;
  if (keyCode == DOWN)  downKey = false;
  if (keyCode == LEFT)  leftKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == ' ')   spaceKey = false;
  if (keyCode == 'v')   teleport = false;
}
