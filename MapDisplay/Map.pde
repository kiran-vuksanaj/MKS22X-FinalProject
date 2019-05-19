class Map{
  Neighborhood[] regions;
  float upperLeftX, upperLeftY, coordWidth;
  ZoomButton zoomControl;
  DataFile data;
  
  Map(DataFile source,String bgFilename) {
    regions = getBGData(bgFilename);
  }
  
  void draw() {
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
      String poly = data[i][0].substring("MULTIPOLYGON (((".length(),data[i][0].length()-3);
      if(i==1) println(poly);
    }
    return null;
  }
}
