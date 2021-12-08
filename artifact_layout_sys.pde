// Artifact Layout System

import http.requests.*;
import blobDetection.*;

import gab.opencv.*;
OpenCV opencv;

PandemicArchiveOfVoices archive = new PandemicArchiveOfVoices();

Canvas canvas;

Layout layout; 

String audioText;

PFont font; 

void setup () {
  size(1920, 1080, P3D);
  background(0);
  audioText = archive.getAudioAsText(91);
  println("audioText length", audioText.length());

  font = createFont("Arial",32,true);

  canvas = new Canvas(this);
}

void draw() {
  background(0);
  translate(0, 0, 0);
  // layout.display();
  canvas.display();

  camera(mouseX, height/2, (mouseY+100) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
}

void keyPressed() {
  if (key == 'k') saveFrame("frame-####.png");
}