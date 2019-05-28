class Map {
  Neighborhood[] regions;
  float upperLeftX, upperLeftY, coordWidth;
  ZoomButton zoomControl;
  DataFile data;
  Menu m;
  int scale;
  float maxDensity;

  Map(DataFile source, String bgFilename) {
    regions = getBGData(bgFilename);

    data = source;

    //setting corners to NYC corners (ish)
    upperLeftX = -74.2834;
    upperLeftY = 40.9408; //currently bottom left because its going to be flipped
    scale = 1400;

    zoomControl = new ZoomButton(this, 50, 100, 550, 650);
    m = new Menu();
  }
  void getMaxDensity(){
    float maxDensity = 0;
    for(Neighborhood n : regions()){
      maxDensity = max(maxDensity,n.getDensity());
    }
    this.maxDensity = maxDensity;
  }
  

  void draw(int mode) {
    if(mode==2){
      m.draw(); //draw menu
    }
    else{
      pushMatrix();
  
      scale(scale, -scale);
      translate(-upperLeftX, -upperLeftY);
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

  void reset() {
    scale = 1400;
    upperLeftX = -74.2834;
    upperLeftY = 40.9408;
  }

  void drag() {
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