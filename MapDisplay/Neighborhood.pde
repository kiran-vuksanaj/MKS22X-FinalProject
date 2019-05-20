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
  void draw(){
    
  }
}
