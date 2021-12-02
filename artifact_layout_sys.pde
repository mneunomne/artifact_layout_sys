// Artifact Layout System

import http.requests.*;
import blobDetection.*;

PandemicArchiveOfVoices archive = new PandemicArchiveOfVoices();

Canvas canvas;

Layout layout; 

String audioText;

PFont font; 

void setup () {
  size(800, 800, P2D);
  background(0);
  audioText = archive.getAudioAsText(91);
  println("audioText length", audioText.length());

  
  canvas = new Canvas();

  font = createFont("Arial",32,true);
  textFont(font);
  textSize(7);
  textAlign(CENTER);
  
  // layout = new Layout(audioText, pg);
  
  // layout.calculate();
  
  // layout.display();

  // saveFrame("layout.png");
  
  //textSize(9);
  //text(audioText, 0, 0, width, height);
  // println("audioText", audioText);
}

void draw() {
  // layout.display();
}
