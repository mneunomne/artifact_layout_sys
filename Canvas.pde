class Canvas {
  PGraphics pg;
  PShape contour;
  BlobDetection blobDetection;
  float blobThreshold = 0.38f;
  boolean drawEdges = true;
  boolean drawRects = true; 
  Canvas () {
    pg = createGraphics(width, height);
  
    pg.beginDraw();
    // background always dark
    pg.background(0);
    drawCircle();
  
    pg.endDraw();

    calculateBlobs();

    calculateContour();

    drawShape();
  }

  void calculateBlobs () {
    blobDetection = new BlobDetection(pg.width, pg.height);
    blobDetection.setPosDiscrimination(false);
    blobDetection.setThreshold(blobThreshold);
    blobDetection.computeBlobs(pg.pixels);
  }

  void drawCircle () {
    pg.background(0);
    pg.ellipse(width/2, height/2, width/2, height/2);
  }

  void calculateContour () {
    Blob b;
    contour = createShape();
    contour.beginShape();
    EdgeVertex eA, eB;
    for (int n=0 ; n<blobDetection.getBlobNb() ; n++) {
      b=blobDetection.getBlob(n);
      if (b!=null) {
        // Edges
        for (int m=0;m<b.getEdgeNb();m++) {
          eA = b.getEdgeVertexA(m);
          eB = b.getEdgeVertexB(m);
          if (eA !=null && eB !=null) {
            float aX = eA.x*width;
            float aY = eA.y*height;
            float bX = eB.x*width;
            float bY = eB.y*height;
            contour.vertex(aX, aY);
            contour.vertex(bX, bY);
            if (drawEdges) {
              strokeWeight(2);
              stroke(0, 255, 0);
              line(aX, aY, bX, bY);
            }
          }
        }
      }
    }
    contour.endShape(CLOSE);
  }

  void drawShape () {
    shape(contour);
  }
}