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
    if(currentScale > 00){
      exteriorMap.setScale( currentScale - 100);
    }  
  }
  void zoomIn(){
    int currentScale = exteriorMap.getScale();
    if(currentScale < 3000){
      exteriorMap.setScale( currentScale + 100);
    }  
  }
  void draw(){
    fill(209);
    rect(x1, y1, x2-x1, y2-y1);
    line(x1, midY, x2, midY);
    
    fill(0);
    textFont(f, 50);
    text("+", x1+5, y1 + 40); //will need to be changed but fine for now
    text("-", x1 + 15, midY + 40);
    
    //print(exteriorMap.scale);
    
    /*if(mouseX > x1 && mouseX < x2 && mouseY > midY && mouseY < y2 && mousePressed == true){
      zoomOut();
    }
    
    if(mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseX < midY && mousePressed == true){
      zoomIn();
    }*/
    
    if(mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2 && mousePressed == true){
      if(mouseY < midY){
        zoomIn();
      }
      if(mouseY > midY){
        zoomOut();
      }
    }
  }
}