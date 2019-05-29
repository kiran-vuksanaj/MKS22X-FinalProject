class Menu{
  int step;
  DataFile data;
  TextBox filename;
  ColumnSelector cols;
  SubmitButton submit;
  Menu(){
    step = 0;
    filename = new TextBox(100,100);
    cols = new ColumnSelector(100,480);
    submit = new SubmitButton(800,530);
  }
  void draw(){
    
  }
  DataFile getDataFile(){
    return null;
  }
}
class TextBox{
  
}
class ColumnSelector{
  
}
class SubmitButton{
  
}
