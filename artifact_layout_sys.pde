// Artifact Layout System

import http.requests.*;

PandemicArchiveOfVoices archive = new PandemicArchiveOfVoices();

PGraphics canvas;

Layout layout; 

String audioText;

PFont font; 

void setup () {
  size(800, 800, P2D);
  background(0);
  audioText = archive.getAudioAsText(91);
  println("audioText length", audioText.length());

  
  PGraphics pg = createGraphics(width, height); 
  
  pg.beginDraw();
  // background always dark
  pg.background(0);
  pg.fill(255);
  pg.stroke(255);
  pg.ellipse(width/2, height/2, width, height);
  //pg.rect(100, 100, 600,600);
  pg.endDraw();
  
  font = createFont("Arial",32,true);
  textFont(font);
  textSize(7);
  textAlign(CENTER);
  
  layout = new Layout(audioText, pg);
  
  layout.calculate();
  
  layout.display();

  saveFrame("layout.png");
  
  //textSize(9);
  //text(audioText, 0, 0, width, height);
  // println("audioText", audioText);
}

void draw() {
  // layout.display();
}
