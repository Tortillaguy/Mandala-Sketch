import java.awt.event.*;
PFont f;
PImage Mandala;


/*
Controls: 
Select 'r', 'g', or 'b' to choose a parameter
Scroll up or down on the wheel to change that par's value
'f' fills the shape
Numbers 0 - 9 changes the number of points
Move the wheel to change size
Click to stamp that shape
's' exports the image to Mandala.png
'c' clears the sketch
*/

color c;
int rotate = 0;
float r = random(200);
float g = random(200);
float b = random(200);
boolean fill = false;
int colormode = 0;
int delta;

int points = 8;
void setup() {
  //Setup
  size(500, 500);
  //background(0);

  //MouseWheel
 addMouseWheelListener(new MouseWheelListener() { 
    public void mouseWheelMoved(MouseWheelEvent mwe) { 
      mouseWheel(mwe.getWheelRotation());
    }
  }
  ); 
  c = color(r, g, b);

  f = createFont("Serif", 16);
  textFont(f);
  textAlign(LEFT);
  Mandala = createImage(width, height, RGB);
  clear();
}

void draw() {
  image(Mandala, 0, 0);
  stroke(255);
  fill(255);
  rectMode(CORNER);
  rect(0, 0, 75, 50);

  fill(0);
  text("Red: " + (int)r, 5, 12);
  text("Green: " + (int)g, 5, 27);
  text("Blue: " + (int)b, 5, 42);

  translate(width/2, height/2);


  rotate(radians(20 * rotate));

  star();
}

void keyPressed() {
  switch(key) {
  case 'c':
    clear();
    break;
  case 'o':
    rotate++;
    break;
  case 'r':
    colormode = 0;
    //change = 0;
    break;
  case 'g':
    colormode = 1;
   // change = 0;
    break;
  case 'b':
    colormode = 2;
   // change = 0;
    break;
  case '1':
    points = 1;
    break;
  case '2':
    points = 2;
    break;
  case '3':
    points = 3;
    break;
  case '4':
    points = 4;
    break;
  case '5':
    points = 5;
    break;
  case '6':
    points = 6;
    break;
  case '7':
    points = 7;
    break;
  case '8':
    points = 8;
    break;
  case '9':
    points = 9;
    break;
  case 's':
    save();
    break;
   case 'f':
     fill = !fill;
     break;
  }
}

void mouseWheel(int delta) {
  
 // change += delta * 2;
 
 if (colormode == 0) {
      if (r + delta * 2 < 256 && r + delta * 2 > 0)
        r += delta * 2;
    }

    if (colormode == 1) {
      if (g + delta * 2 < 256 && g + delta * 2 > 0)
        g += delta * 2;
    }

    if (colormode == 2) {
      if (b + delta * 2 < 256 && b + delta * 2 > 0)
        b += delta * 2;
    }
  c = color(r, g, b);
}

void star() {
  for (int i = 0; i < points; i++) {
    stroke(c);
    if (fill == true)
      fill(c);
    else if (fill == false)
      noFill();
    pushMatrix();
    ellipse(0, 0, (mouseX-width/2) * 1.7, 1.7 * (mouseY-height/2) );
    rotate(radians(360/points));
  }
  for (int i = 0; i < points; i++) {
    popMatrix();
  }
}


void mousePressed() {
  loadPixels();
  for (int x = 0; x < Mandala.width-1; x++) {
    for (int y = 0; y < Mandala.height-1; y++) {
      int pos = y * Mandala.width + x;
      Mandala.pixels[pos] = pixels[pos];
    }
  }
  Mandala.updatePixels();
}
void clear() {
  loadPixels();
  for (int x = 0; x < Mandala.width-1; x++) {
    for (int y = 0; y < Mandala.height-1; y++) {
      int pos = y * Mandala.width + x;
      Mandala.pixels[pos] = color(0);
    }
  }
  Mandala.updatePixels();
}

void save(){
   save("Mandala.png");
}

