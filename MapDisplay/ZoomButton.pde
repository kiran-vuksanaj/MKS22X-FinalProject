class ZoomButton{
  Map exteriorMap;
  int x1, x2, y1, y2;
  
  ZoomButton(Map parent, int X1, int X2, int Y1, int Y2){
    x1 = X1;
    x2 = X2;
    y1 = Y1;
    y2 = Y2;
    
  }
  void zoomOut(){
   
  }
  void zoomIn(){
    
  }
  void draw(){
    fill(209);
    rect(x1, y1, x2-x1, y2-y1);
    if(mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY >= (y2-y1)/2 + y1 && mousePressed == true){
      zoomIn();
    }
    
    if(mouseX >= x1 && mouseX <= x2 && mouseY >= (y2-y1)/2 + y1 && mouseY >= y2 && mousePressed == true){
      zoomOut();
    }
  }
}
