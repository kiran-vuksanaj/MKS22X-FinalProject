class Neighborhood{
  float area;
  String name;
  double[][][] polyCorners;
  Point[] internalPoints;
  float r,g,b;
  
  Neighborhood(String name,float area,double[][][] polyCorners){
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
    for(double[][] poly : polyCorners){
      for(double[] coord : poly){
        out+= "\t("+coord[0]+","+coord[1]+")\n";
      }
      out+="\n";
    }
    return out;
  }
  void draw(){
    fill(255);
    //creating a custom polygon for each neighborhood
    for(double[][] poly : polyCorners){
      beginShape();
      for(double[] corner : poly){
        vertex((float)(corner[0]+74.2744)*1500, (float)(corner[1]-40.4793)*1500);
      }
      endShape();
    }
  }
}
