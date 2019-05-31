class Popup{
  String name,info;
  Point parentPoint;
  
  Popup(Point parent,String n,String inf){
    //println(info);
    parentPoint = parent;
    name = n;
    info = inf;
  }
  
  String getInfo(){
    return ""; //temporary
  }
  void draw(){
    fill(170);
    rect((float)parentPoint.longitude, (float)parentPoint.latitude, 200, 100);
  }
}