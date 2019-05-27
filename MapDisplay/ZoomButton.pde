class ZoomButton{
  PFont f;
  Map exteriorMap;
  int x1, x2, y1, y2, midY;
  
  ZoomButton(Map parent, int X1, int X2, int Y1, int Y2){
    x1 = X1;
    x2 = X2;
    y1 = Y1;
    y2 = Y2;
    midY = (Y2-Y1)/2+Y1; 
    f = createFont("Arial",16,true);  // Loading font
    exteriorMap = parent;
  }
  void zoomOut(){
    int currentScale = exteriorMap.getScale();
    if(currentScale > 500){
      exteriorMap.setScale( currentScale - 100);
    }  
  }
  void zoomIn(){
    int currentScale = exteriorMap.getScale();
    if(currentScale < 3000){
      exteriorMap.setScale( currentScale + 100);
    }  
  }
  void resetZoom(){
    exteriorMap.reset();
  }
  void draw(){
    fill(209);
    rect(x1, y1, x2-x1, y2-y1);
    line(x1, midY, x2, midY);
    rect(x2, midY, x2-x1, (y2-y1)/2);
    
    fill(0);
    textFont(f, 50);
    text("+", x1+10, y1 + 40); //will need to be changed but fine for now
    text("-", x1 + 20, midY + 40);
    ellipse((x2-x1)/2+x2, (y2-midY)/2+midY, 20, 20);
    
   
    if(mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2 && mousePressed == true){
      if(mouseY < midY){
        zoomIn();
      }
      if(mouseY > midY){
        zoomOut();
      }
    }
    if(mouseX > x2 && mouseX < ((x2-x1)+x2) && mouseY > midY && mouseY < y2 && mousePressed == true){
      resetZoom();
    }
  }
}
