class Point{
  double latitude,longitude;
  Popup extraData;
  Neighborhood parentNeighborhood;
  String info;
  boolean showPopup;
  Map map;

  Point(Map external, double[] coords,String otherData){
    map = external;
    longitude = coords[0];
    latitude = coords[1];
    extraData = new Popup(this, "", otherData, map);
  }

  void draw(int scale){
    fill(0,255,207);
    strokeWeight(.1/scale);
    ellipse((float)(longitude),(float)(latitude),10.0/scale,10.0/scale);
    //popup();
  }
  
  void popup(){
    if(showPopup){
      //print(info);
      
      //extraData = new Popup(this, info, info);
      extraData.draw();
    }
  }

  boolean clickedHere(float lati, float longi){
    //println("Longitude: " + longitude + "    Longi: " + longi);
    //println("Latitude: " + latitude + "    Lati: " + lati);
    if((longi < longitude + .0015 && longi > longitude - .0015) 
      && (lati < latitude + .0015 && lati > latitude - .0015)){
      showPopup = true;
      popup();
      //showPopup = false;
      return true;
    }
    else{
      showPopup = false;
      return false;
    }
  }

  boolean assigntoRegion(Neighborhood[] regions){//returns whether successful
    for(Neighborhood n : regions){
      if(containedInNeighborhood(n)){
        parentNeighborhood = n;
        n.addPoint(this);
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
