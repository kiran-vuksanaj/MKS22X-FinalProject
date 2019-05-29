class Menu{
  int step;
  DataFile data;
  TextBox filename;
  ColumnSelector cols;
  SubmitButton submit;
  Menu(){
    step = 0;
    filename = new TextBox(100,100);
    //submit = new SubmitButton(800,530);
  }
  void keyPressed(){
    if(step==0){//keystrokes only do something if on step 0
      if(key==ENTER||key==RETURN){
        enterColumnStep();
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
  void enterColumnStep(){
    data = new CSVFile(filename.textInput());
    cols = new ColumnSelector(100,480,data.getHeaders());
    step = 1;
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
  String textInput(){
    return input;
  }
}
class ColumnSelector{
  float r,c;
  Button[] buttons;
  ColumnSelector(float r,float c,String[] options){
    this.r = r;
    this.c = c;
    buttons = new Button[options.length];
    for(int i=0;i<buttons.length;i++){
      buttons[i] = new Button(r+20*i,c,options[i]);
    }
  }
  void draw(){
    for(Button b : buttons){
      b.draw();
    }
  }
  private class Button{
    float r,c;
    String name;
    boolean chosen;
    Button(float r,float c,String name){
      this.r = r;
      this.c = c;
      this.name = name;
      chosen = false;
    }
    void draw(){
      fill(255);
      rect(r,c,80,20,5);
      text(name,r+4,c);
    }
  }
}
class SubmitButton{
  
}
