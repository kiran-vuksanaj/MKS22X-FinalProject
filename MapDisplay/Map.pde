class Map{
  Neighborhood[] regions;
  float upperLeftX, upperLeftY, coordWidth;
  ZoomButton zoomControl;
  DataFile data;
  
  Map(DataFile source,String bgFilename) {
    regions = getBGData(bgFilename);
    
    //setting corners to NYC corners (ish)
    upperLeftX = -74.2744;
    upperLeftY = 40.4793; //currently bottom left because its going to be flipped
    coordWidth = -73.7045 - (-74.2744);
  }
  
  void draw() {
    pushMatrix();
  
    
    translate(-upperLeftX*400, -upperLeftY*400);
   
    scale(400);
    //rect(-74, 40, 30, 30);
    for(Neighborhood n: regions){
      n.draw();
    }
    popMatrix();
  }
  void setZoom(float upperLeftX, float upperLeftY, float coordWidth) {
  }
  Neighborhood[] regions() {
    return regions;
  }
  
  private Neighborhood[] getBGData(String filename){
    //@emory: if u start coding next part,make some fake neighborhoods here; ill fill in code to access file
    BufferedReader reader = createReader(filename);
    String[][] data = parseCSV(reader,1,5,7);
    Neighborhood[] out = new Neighborhood[data.length-1];
    for(int i=1;i<data.length;i++){//skip header line
      double[][][][] coords = parseMultiPolygon(data[i][0]);
      out[i-1] = new Neighborhood(data[i][1],float(data[i][2]),coords);
    }
    return out;
  }
}
