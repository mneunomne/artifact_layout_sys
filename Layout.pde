class Layout {
  String text;
  PGraphics pg;
  int boxW = 10;
  float fontSize;
  ArrayList <PVector> positions = new ArrayList<PVector>();
  
  ArrayList <PVector> contour = new ArrayList<PVector>();
  
  int textLength;
  
  int marginTop = 10;
  int marginBottom = 10;
  int marginX = 15;
  
  int threshold = 10;
  
  Layout (String _text, PGraphics _pg) {
    text = _text;
    pg = _pg;
    textLength = text.length();
  }
  
  void calculate () {
    pg.loadPixels();
    PVector lastPoint;
    
    int detectionX;
    for (int y = marginTop; y < height - boxW; y+=boxW) {
      for (int x = marginX; x < width - boxW; x+=boxW) {
        int index = x + y*width;
        boolean a, b, c, d;
        
        a = brightness(pg.pixels[(x + y*width)]) > threshold;
        b = brightness(pg.pixels[(x + boxW) + y*width]) > threshold;
        c = brightness(pg.pixels[(x + boxW) + (y + boxW)*width]) > threshold;
        d = brightness(pg.pixels[x + (y + boxW)*width]) > threshold;
        
        if (a && b && c && d) {
          positions.add(new PVector(x, y));
        }
        
      }
    }
  }
  
  void display () {
    //image(pg, 0, 0);
    stroke(255, 0, 0);
    noFill();
    int index = 0;
    for (PVector p : positions) {
      noFill();
      rect(p.x, p.y, boxW, boxW);
      print(Character.toString(text.charAt(index)));
      text(Character.toString(text.charAt(index)), p.x, p.y, boxW, boxW); 
      index++;
    }
    
  }
}
