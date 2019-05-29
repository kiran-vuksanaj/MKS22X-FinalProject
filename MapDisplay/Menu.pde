class Menu{
  int step;
  DataFile data;
  TextBox filename;
  ColumnSelector cols;
  SubmitButton submit;
  Menu(){
    step = 0;
    filename = new TextBox(100,100);
    //cols = new ColumnSelector(100,480);
    //submit = new SubmitButton(800,530);
  }
  void keyPressed(){
    if(step==0){//keystrokes only do something if on step 0
      if(key==ENTER||key==RETURN){
        step = 1;
      }else{
        filename.add(key);
      }
    }
  }
  void draw(){
    switch(step){
      case 0:
        filename.draw();
    }
  }
  DataFile getDataFile(){
    return null;
  }
}
class TextBox{
  float r,c;
  String input;
  TextBox(float r,float c){
    this.r = r;
    this.c = c;
    input = "inputFiles/";
  }
  void add(char c){
    input += c;
  }
  void draw(){
    text("filename (click enter when complete): "+input,r,c);
  }
}
class ColumnSelector{
  
}
class SubmitButton{
  
}
