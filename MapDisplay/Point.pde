class Point{
  double latitude,longitude;
  Popup extraData;
  Neighborhood parentNeighborhood;
  boolean showPopup;
  
  Point(double[] coords,String otherData){
    longitude = coords[0];
    latitude = coords[1];
  }
  
  void draw(int scale){
    fill(0,255,207);
    ellipse((float)(longitude),(float)(latitude),5.0/scale,5.0/scale);
  }
  
  void assigntoRegion(Neighborhood[] regions){
    
  }
}
