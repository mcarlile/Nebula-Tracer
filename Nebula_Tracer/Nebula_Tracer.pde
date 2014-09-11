import ddf.minim.*;

//Assignent 2: Media Arts & Practice 404 Tactical Media
//McKenzie Carlile
//bass.wav taken from freesound.org user EKVelika
//https://www.freesound.org/people/EKVelika/sounds/209571/

PImage img;
PImage[] images = new PImage[5]; 
int i = 0;
int savedTime;
int savedTime2;
int totalTime = 50;
int totalTime2 = 1000;
int orbSpeed = 20;
float recordedX = 0;
float recordedY = 200;
boolean fire = false;
Minim minim;
AudioPlayer player;


void setup () {
  size(800, 500, P2D);

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
  savedTime2 = millis();
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
    savedTime = millis();
  }

  int passedTime2 = millis() - savedTime2;
  if (passedTime2 > totalTime2) {
    fire = false;
    savedTime2 = millis();
  } else {
    recordedX = mouseX;
    fire = true;
  }

  //rect(0, 0, width, height);

  //  background (14, 43, 57);  
  fill(0, 11, 17, 90);
  rect(0, 0, width, height);

  if (recordedY > 475) {
    recordedY = 200;
  }


  if (fire) {
    //float rV = random(-1, 1);
    recordedY = recordedY + orbSpeed;
    image (img, recordedX+75, (recordedY), 50, 50);
  }

  image (img, mouseX, (height/2-100), 200, 200);
}

void mousePressed () {
  recordedX = mouseX;
  fire = true;
  //fireNewOrb();
}

void fireNewOrb () {
  recordedX = mouseX;
  image (img, recordedX+50, (recordedY++), 50, 50);
}

