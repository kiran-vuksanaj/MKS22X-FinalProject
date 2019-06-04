class Popup{
  String name,info;
  Point parentPoint;
  Map map;
  
  Popup(Point parent,String n,String inf, Map m){
    map = m;
    parentPoint = parent;
    name = n;
    info = inf;
    //println(info);
  }
  
  String getInfo(){
    return info; //temporary
  }
  
  String infoBackwards(String info){
    String out = "";
    for(int i = info.length()-1; i >= 0; i--){
      out += info.charAt(i);
    }
    
    return out;
  }
  
  void draw(){
    fill(170);
   // rect((float)parentPoint.longitude, (float)parentPoint.latitude, .18, .12);
    rect(500, 500, 370, 160);
    fill(0);
    textSize(15);
    text(info, 510, 510, 350, 140);
  }
}
