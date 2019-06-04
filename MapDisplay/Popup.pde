class Popup{
  String name,info;
  Point parentPoint;
  
  Popup(Point parent,String n,String inf){
    
    parentPoint = parent;
    name = n;
    info = inf;
    //println(info);
  }
  
  String getInfo(){
    return info; //temporary
  }
  void draw(){
    fill(170);
    rect((float)parentPoint.longitude, (float)parentPoint.latitude, .18, .12);
    fill(0);
   // println(info, (float)parentPoint.longitude, (float)parentPoint.latitude);
    text(info, (float)parentPoint.longitude, (float)parentPoint.latitude);//, .18, .12);
  }
}
