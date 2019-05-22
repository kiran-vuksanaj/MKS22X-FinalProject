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
    
  }
  
  void assigntoRegion(Neighborhood[] regions){
    
  }
}
