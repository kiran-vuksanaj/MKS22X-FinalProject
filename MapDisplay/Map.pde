class Map {
  Neighborhood[] regions;
  float upperLeftX, upperLeftY, coordWidth;
  ZoomButton zoomControl;
  DataFile data;
  int scale;
  float maxDensity;
  Point lastClicked;

  Map(DataFile source, String bgFilename) {
    regions = getBGData(bgFilename);

    data = source;

    //setting corners to NYC corners (ish)
    upperLeftX = -74.2834;
    upperLeftY = 40.9408; //currently bottom left because its going to be flipped
    scale = 1400;


    zoomControl = new ZoomButton(this, 50, 100, 550, 650);
  }
  void getMaxDensity(){
    float maxDensity = 0;
    for(Neighborhood n : regions()){
      maxDensity = max(maxDensity,n.getDensity());
    }
    this.maxDensity = maxDensity;
  }
  

  void draw(int mode) {
    pushMatrix();
    moveToCoords();
    fill(0, 0, 0);
    if(mode==1){
      for (Neighborhood n : regions) {
        n.draw(maxDensity);
      }
    }
    else if(mode==0){
      for(Neighborhood n : regions) {
        n.draw(0);
      }
      for (Point p : data.points()) {
        p.draw(scale);
      }
    }
    popMatrix();
    zoomControl.draw();


  }
  void drawOverlay(int mode){
    fill(0);
    //text();
    fill(212, 227, 179);
    rect(15, 15, 265, 50);
    fill(0);
    textSize(20);
    if(mode==0){
      text("To view density map,", 26, 35);
      text("press the arrow up button.", 28, 53);
    }
    if(mode==1){
      text("To view point map,", 26, 35);
      text("release the arrow up button.", 28, 53);
      fill(255);
      rect(630, 600, 40, 40);
      fill(209);
      rect(670, 600, 40, 40);
      fill(167);
      rect(710, 600, 40, 40);
      fill(87);
      rect(750, 600, 40, 40);
      fill(50);
      rect(790, 600, 40, 40);
      fill(0);
      rect(830, 600, 40, 40);
      textSize(18);
      text("least dense", 620, 585);
      text("most dense", 800, 585);
    }
  }
  void mousePressed(float longitude, float latitude){
    for(Point p : data.points()){
      p.clickedHere(longitude, latitude);
    }
  }
  void setScale(int newScale) {
    scale = newScale;
  }

  int getScale() {
    return scale;
  }

  Neighborhood[] regions() {
    return regions;
  }
  void moveToCoords(){
    scale(scale, -scale);
    translate(-upperLeftX, -upperLeftY);
  }

  void reset() {
    scale = 1400;
    upperLeftX = -74.2834;
    upperLeftY = 40.9408;
  }
  
  float correctX(float x){
    x /= scale;
    return x + upperLeftX;
  }
  float correctY(float y){
    y /= -scale;
    return y + upperLeftY;
  }



  private Neighborhood[] getBGData(String filename) {
    //@emory: if u start coding next part,make some fake neighborhoods here; ill fill in code to access file
    BufferedReader reader = createReader(filename);
    String[][] data = parseCSV(reader, 1, 5, 7);
    Neighborhood[] out = new Neighborhood[data.length-1];
    for (int i=1; i<data.length; i++) {//skip header line
      double[][][][] coords = parseMultiPolygon(data[i][0]);
      out[i-1] = new Neighborhood(data[i][1], float(data[i][2]), coords);
    }
    return out;
  }
}
