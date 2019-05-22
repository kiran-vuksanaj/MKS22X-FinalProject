class ZoomButton{
  PFont f;
  Map exteriorMap;
  int x1, x2, y1, y2;
  
  ZoomButton(Map parent, int X1, int X2, int Y1, int Y2){
    x1 = X1;
    x2 = X2;
    y1 = Y1;
    y2 = Y2;
    f = createFont("Arial",16,true);  // Loading font
    exteriorMap = parent;
  }
  void zoomOut(){
    int currentScale = exteriorMap.getScale();
    if(currentScale > 1000){
      exteriorMap.setScale( currentScale - 100);
    }  
  }
  void zoomIn(){
    int currentScale = exteriorMap.getScale();
    if(currentScale < 2000){
      exteriorMap.setScale( currentScale + 100);
    }  
  }
  void draw(){
    fill(209);
    rect(x1, y1, x2-x1, (y2-y1)/2+y1);
    rect(x1, (y2-y1)/2+y1, x2-x1, (y2-y1)/2+y1);
    
    fill(0);
    textFont(f, 50);
    text("+", x1, y1); //will need to be changed but fine for now
    text("-", x1, (y2-y1)/2+y1);
    
    if(mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY >= (y2-y1)/2 + y1 && mousePressed == true){
      zoomIn();
    }
    
    if(mouseX >= x1 && mouseX <= x2 && mouseY >= (y2-y1)/2 + y1 && mouseY >= y2 && mousePressed == true){
      zoomOut();
    }
  }
}