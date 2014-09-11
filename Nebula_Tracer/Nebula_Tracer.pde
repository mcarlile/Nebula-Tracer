//Assignent 2: Media Arts & Practice 404 Tactical Media
//McKenzie Carlile

PImage img;
PImage[] images = new PImage[5]; 
int i = 0;
int savedTime;
int totalTime = 50;

void setup () {
  size(800, 500, P2D);
  background (14, 43, 57);  

  noStroke();
  noCursor();
  smooth();

  images[0] = loadImage("orb1.png");
  images[1] = loadImage("orb2.png");
  images[2] = loadImage("orb3.png");
  images[3] = loadImage("orb4.png");
  images[4] = loadImage("orb5.png");

  savedTime = millis();
  img = images [i];
  savedTime = millis();
}

void draw () {
  img = images [i];
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    if (i < 4) {
      i++;
    } else {
      i = 0;
    }
    println(i);
    savedTime = millis();
  }

  //rect(0, 0, width, height);

  //  background (14, 43, 57);  
  background (0); 
  image (img, mouseX, mouseY, 200, 200);
}

