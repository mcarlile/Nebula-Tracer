import ddf.minim.*;

//Assignent 2: Media Arts & Practice 404 Tactical Media
//McKenzie Carlile

PImage img;
PImage[] images = new PImage[5]; 
int i = 0;
int savedTime;
int savedTime2;
int totalTime = 50;
int totalTime2 = 2000;
int orbSpeed = 20;
int bottom;
int left;
int right;
float recordedX = 0;
float recordedY = 200;
boolean fire = false;
boolean xhasbeenrecorded = false;

Minim minim;
AudioPlayer bass;
AudioPlayer wobble;


void setup () {
  size(800, 500, P2D);
  minim = new Minim(this);
  bass = minim.loadFile("bass.wav");
  wobble = minim.loadFile("wobble.mp3");

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
  wobble.play();
  //  bottom = (7*(height/8));
  bottom = height/2;
  left = width/8;
  right =((width/8)*7);
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
    savedTime2 = millis();
  } else {
    fire = true;
  }

  //  background (14, 43, 57);  
  fill(0, 11, 17, 50);
  noStroke();
  rect(0, 0, width, height);

  //  if (recordedY > bottom-50) {
  //    bass.rewind();
  //    xhasbeenrecorded = false;
  //    recordedY = 200;
  //    image (img, recordedX, (bottom-100), 200, 200);
  //  }


  if (fire) {
    //float rV = random(-1, 1);
    recordedY = recordedY + orbSpeed;
    if (xhasbeenrecorded == false) {
      recordedX = mouseX;
      xhasbeenrecorded = true;
    }
    if (mouseX < right-100) {
      image (img, recordedX+75, (recordedY), 50, 50);
    } else {
      image (img, right-25, (recordedY), 50, 50);
    }
    //bass.play();
  }
  if (mouseX < right-100) {
    image (img, mouseX, mouseY, 200, 200);
  } else {
    image (img, right-100, mouseY, 200, 200);
  }
  stroke (180, 234, 254);
  strokeWeight(5);
  line (left, bottom, right, bottom);
  if (recordedY > bottom-50) {
    bass.rewind();
    xhasbeenrecorded = false;
    recordedY = mouseY+50;
    if (mouseX < right-100) {
      image (img, recordedX, (bottom-100), 200, 200);
    } else {
      image (img, right-100, (bottom-100), 200, 200);
    }

    println(mouseX);
  }
}

//works cited

//bass.wav taken from freesound.org user Benboncan
//https://www.freesound.org/people/Benboncan/sounds/75727/
//wobble.mp3 taken from freesound.org user Trebblofang
//https://www.freesound.org/people/Trebblofang/sounds/178113/

