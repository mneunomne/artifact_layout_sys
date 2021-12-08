class Canvas {
  PGraphics renderCanvas;

  PGraphics textCanvas;

  PImage src, dst;
  PShape shape;
  // BlobDetection blobDetection;
  int bThreshold = 125;
  boolean drawEdges = true;
  boolean drawRects = true;

  float prop = 1.4142f;

  int marginY;
  int marginX;

  int b_w = 8;
  int b_h = 8;

  int w;
  int h;

  ArrayList<PVector> points = new ArrayList<PVector>();
  // ArrayList<Contour> polygons;

  Canvas (PApplet theParent) {
    renderCanvas = createGraphics(width, height);

    marginY = 25; 

    h = height - marginY * 2;
    w = int(float(h) / prop);

    textCanvas = createGraphics(w, h);
    
    marginX = (width - w)/2;
    shape = createShape(RECT, marginX, marginY, w, h);
    shape.setFill(color(255));

    renderCanvas.beginDraw();
    renderCanvas.background(0);
    renderCanvas.stroke(255);
    renderCanvas.shape(shape);
    renderCanvas.endDraw();

    shape.setFill(color(0, 0));
    shape.setStroke(color(255, 0, 0));

    calculateContour();

    // renderShape();

    renderText();
  }

  void calculateContour () {
    points.clear();
    renderCanvas.loadPixels();
    for (int y = b_h; y < renderCanvas.height-b_h*2; y+=b_h){
      for (int x = b_w; x < renderCanvas.width-b_w*2; x+=b_w){
        int a = y*width+x;
        int b = y*width+(x+b_w);
        int c = y*width+(x+b_w);
        int d = (y+b_h)*width+x;

        boolean brigthnessA = brightness(renderCanvas.pixels[a]) > bThreshold;
        boolean brigthnessB = brightness(renderCanvas.pixels[b]) > bThreshold;
        boolean brigthnessC = brightness(renderCanvas.pixels[c]) > bThreshold;
        boolean brigthnessD = brightness(renderCanvas.pixels[d]) > bThreshold;
        // println("point ?", brightness);
        if (brigthnessA && brigthnessB && brigthnessC && brigthnessD) {
          points.add(new PVector(x, y));
          println("point added", x, y);
        }
      }
    }
}

  void renderShape () {
    //image(renderCanvas, 0, 0);
    noFill();
    stroke(255, 0, 0);
    shape(shape);
    stroke(0, 255, 0);
    int index = 0;
    for (PVector p : points) {
      rect(p.x, p.y, 8, 8);
      text(Character.toString(audioText.charAt(index)), p.x, p.y, b_w, b_h); 
      index++;
    }
  }

  void renderText () {
    //image(renderCanvas, 0, 0);
    textCanvas.beginDraw();
    // textCanvas.background(0, 0);
    textCanvas.textFont(font);
    textCanvas.textSize(8);
    textCanvas.textAlign(CENTER);
    textCanvas.beginDraw();
    textCanvas.fill(255);
    textCanvas.stroke(255);
    int index = 0;
    for (PVector p : points) {
      if (index < audioText.length()) {
        textCanvas.text(Character.toString(audioText.charAt(index)), p.x-marginX, p.y-marginY); 
        index++;
      }
    }
    textCanvas.endDraw();
  }

  void display () {
    //lights();
    pushMatrix();
      fill(10);
      stroke(10);
      translate(width/2, height/2, -21);
      box(w, h, 40);
    popMatrix();
    
    pushMatrix();
      translate(marginX, marginY, 0);
      image(textCanvas, 0, 0);
    popMatrix();    
  }
}