class Point{
  double latitude,longitude;
  Popup extraData;
  Neighborhood parentNeighborhood;
  boolean showPopup;
  
  Point(double[] coords,String otherData){
    longitude = coords[0];
    latitude = coords[1];
  }
  
  void draw(){
    fill(0,0,0);
    ellipse((float)(longitude),(float)(latitude),0.004,0.004);
  }
  
  void assigntoRegion(Neighborhood[] regions){
    
  }
}
