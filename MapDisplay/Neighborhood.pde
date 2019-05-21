class Neighborhood{
  float area;
  String name;
  float[][] polyCorners;
  Point[] internalPoints;
  float r,g,b;
  
  Neighborhood(String name,float area,float[][] polyCorners){
    this.name = name;
    this.area = area;
    this.polyCorners = polyCorners;
  }
  
  float getArea(){
    return area;
  }
  float getDensity(){
    
    return -1; //temporary
  }
  private float[] getColorScale(float density){
    return null; //temporary
  }
  String getName(){
    return ""; //temporary
  }
  void addPoint(Point p){
    
  }
  String toString(){
    return "{"+name+";"+area+";"+polyCorners.length+";"+polyCorners[int(random(polyCorners.length))][0]+"}";
  }
  String toStringCoords(){
    String out = name+":\n";
    for(float[] coord : polyCorners){
      out+= "\t("+coord[0]+","+coord[1]+")\n";
    }
    return out;
  }
  void draw(){
    //fill(0, 0, 255);
    //creating a custom polygon for each neighborhood
    beginShape();
    for(float[] corner : polyCorners){
      vertex(corner[0], corner[1]);
      //vertex((corner[0]+74.2744)*1500, (corner[1]-40.4793)*1500);
    }
    endShape();
  }
}
