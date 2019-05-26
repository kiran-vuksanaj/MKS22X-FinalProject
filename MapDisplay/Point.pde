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
    strokeWeight(.1/scale);
    ellipse((float)(longitude),(float)(latitude),10.0/scale,10.0/scale);
  }
  
  boolean assigntoRegion(Neighborhood[] regions){//returns whether successful
    for(Neighborhood n : regions){
      if(containedInNeighborhood(n)){
        return true;
      }
    }
    return false;
  }
  private boolean containedInNeighborhood(Neighborhood n){
    double[][][][] region = n.polyCorners;
    for(double[][][] polygon : region){
      println(polygon.length > 2);
    }
    return false;
  }
}