class Neighborhood{
  float area;
  String name;
  double[][][][] polyCorners;
  ArrayList<Point> internalPoints;
  float r,g,b;
  
  Neighborhood(String name,float area,double[][][][] polyCorners){
    this.name = name;
    this.area = area;
    this.polyCorners = polyCorners;
    r = random(255);
    g = random(255);
    b = random(255);
    internalPoints = new ArrayList<Point>();
  }
  
  void mousePressed(float longitude, float latitude){
    println(name);
    for(Point p : internalPoints){
      if(p.clickedHere(longitude, latitude)){
        break;
      }
    }
  }
  
  float getArea(){
    return area;
  }
  float getDensity(){
    return internalPoints.size()/area;
  }
  private float getColorScale(float maxDensity){
    if(maxDensity == 0){
      return 255;
    }
    return 255 - getDensity()/maxDensity*255;
  }
  String getName(){
    return ""; //temporary
  }
  void addPoint(Point p){
    internalPoints.add(p);
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
  void draw(float maxDensity){
    strokeWeight(0);
    for(double[][][] poly : polyCorners){
      fill(getColorScale(maxDensity));
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
