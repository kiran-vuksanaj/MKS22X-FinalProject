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
      /*FOR FUTURE NOTICE
        format of MULTIPOLYGON:
        (POLYGON, POLYGON, ...)
        format of POLYGON:
        (POLY, ANTIPOLY)
        format of POLY/ANTIPOLY:
        (x y, x y, x y, x y, ...)
      */
      if(containedInPoly(polygon[0],longitude,latitude) &&
         (polygon.length < 2 || !containedInPoly(polygon[1],longitude,latitude)))
         return true;
         //AKA: if inside main poly and if theres an antipoly its not inside that, then return true
    }
    return false;
  }
}
