class Map {
  Neighborhood[] regions;
  float upperLeftX, upperLeftY, coordWidth;
  ZoomButton zoomControl;
  DataFile data;
  int scale;
  boolean locked;
 
  Map(DataFile source, String bgFilename) {
    regions = getBGData(bgFilename);

    data = source;

    //setting corners to NYC corners (ish)
    upperLeftX = -74.2834;
    upperLeftY = 40.9408; //currently bottom left because its going to be flipped
    scale = 1400;


    zoomControl = new ZoomButton(this, 50, 100, 550, 650);
  }

  void draw() {

    
    pushMatrix();

    scale(scale, -scale);
    translate(-upperLeftX, -upperLeftY);
    fill(0, 0, 0);

    for (Neighborhood n : regions) {
      n.draw();
    }
    for (Point p : data.points()) {
      p.draw(scale);
    }
    popMatrix();

    zoomControl.draw();
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
  
  /*void mousePressed(){
    if(mouseX > 150 || mouseY < 550){
      print("locked ");
      locked = true;
    }
  }
  
  void mouseDragged(){
    if(locked){
       upperLeftX += (mouseX - pmouseX)/scale;
       upperLeftY += (mouseY - pmouseY)/scale;
    }
  }

  /*void drag() {
    if (mousePressed && (mouseX > 150 || mouseY < 550)) {
      print("1");
      float origX = mouseX;
      float origY = mouseY;
      
      float newX = 0.0;
      float newY = 0.0;
      
      while (mousePressed) {
        newX = mouseX;
        newY = mouseY;
        print(newX + ", " + newY);
      }
      
      upperLeftX += (newX-origX)/scale;
      upperLeftY += (newY-origY)/scale;
      print(upperLeftX + ", " + upperLeftY);
    }
  }*/

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
