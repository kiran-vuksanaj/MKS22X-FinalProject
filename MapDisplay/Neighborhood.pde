class Neighborhood{
  float area;
  String name;
  double[][][][] polyCorners;
  Point[] internalPoints;
  float r,g,b;
  
  Neighborhood(String name,float area,double[][][][] polyCorners){
    this.name = name;
    this.area = area;
    this.polyCorners = polyCorners;
    r = random(255);
    g = random(255);
    b = random(255);
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
    for(double[][][] poly : polyCorners){
      for(double[][] innerPoly : poly){
        for(double[] coord : innerPoly){
          out+= "\t("+coord[0]+","+coord[1]+")\n";
        }
        out+="\n";
      }
      out+="\n";
    }
    return out;
  }
  void draw(){
    fill(r, g, b);
    //creating a custom polygon for each neighborhood
    fill(255);
    strokeWeight(0.0005);
    for(double[][][] poly : polyCorners){
      fill(255);
      beginShape();
      for(double[] corner : poly[0]){
        //vertex((float)((corner[0]+74.2744)*1500), (float)((corner[1]-40.4793)*1500));
        vertex((float)(corner[0]), (float)(corner[1]));
      }
      endShape();
      if(poly.length>1){
        fill(50,140,200); //color of water, since the second one is an antipolygon
        beginShape();
        for(double[] corner : poly[1]){
          vertex((float)(corner[0]), (float)(corner[1]));
        }
        endShape();
      }
    }
  }
}
