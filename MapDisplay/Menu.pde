class Menu {
  int step;
  MapDisplay external;
  CSVFile data;
  TextBox filename;
  ColumnSelector cols;
  SubmitButton submit;
  
  Menu(MapDisplay parent) {
    step = 0;
    filename = new TextBox(100, 100);
    external = parent;
  }
  void keyPressed() {
    if (step==0) {//keystrokes only do something if on step 0
      if (key==ENTER||key==RETURN) {
        enterColumnStep();
      } else if (key==BACKSPACE) {
        filename.backspace();
      } else if (key!=CODED) {
        filename.add(key);
      }
    }
  }
  void draw() {
    switch(step) {
    case 0:
      filename.draw();
      break;
    case 1:
      filename.draw();
      cols.draw();
      submit.draw();
      break;
    }
  }
  DataFile getDataFile() {
    return data;
  }
  void enterColumnStep() {
    data = new CSVFile(filename.textInput());
    cols = new ColumnSelector(150, 200, data.getHeaders());
    submit = new SubmitButton(150, 480, 100, 200, this);
    step = 1;
  }
  void exitMenu() {
    step = 2;
    data.getData(cols.getCols());
    external.exitMenu();
  }
  boolean mousePressed() {
    if (step==1) {
      return cols.mousePressed() || submit.mousePressed(); //using short circuiting here
    }
    return false;
  }
  
}
class TextBox {
  float r, c;
  String input;
  TextBox(float r, float c) {
    this.r = r;
    this.c = c;
    input = "inputFiles/";
  }
  void add(char c) {
    input += c;
  }
  void backspace() {
    input = input.substring(0, input.length()-1);
  }
  void draw() {
    text("filename (click enter when complete): "+input, r, c);
  }
  String textInput() {
    return input;
  }
}
class ColumnSelector {
  float r, c;
  Button[] buttons;
  ColumnSelector(float r, float c, String[] options) {
    print(options.length);
    this.r = r;
    this.c = c;
    
    for(String str : options){
      println(str);
    }
    
    buttons = new Button[options.length ];
    for (int i=0; i<buttons.length; i++) {
      if(options[i].equals("the_geom")){
        buttons[i] = new Button(r+(20*i), c, "DATA");
      }
     else{
        buttons[i] = new Button(r+(20*i), c, options[i]);
      }
      
    }

  }
  void draw() {
    for (Button b : buttons) {
        b.draw();
      }
    }
  }
  boolean mousePressed() {
    if (mouseX > c && mouseX < c+80 && 
      mouseY > r && mouseY < r+(20*buttons.length)) {
      int idx = (int)((mouseY - r)/20);
      buttons[idx].toggle();
    }
    return false;
  }
  private int countOn() {
    int out = 0;
    for (Button b : buttons) {
      if (b.chosen) out++;
    }
    return out;
  }
  int[] getCols() {
    int[] out = new int[countOn()+1];
    int c = 0;
    for(int i=0;i<buttons.length && i <=10;i++){// the first column Always has to be the geom
      if(buttons[i].name.equals("DATA")) out[c++] = i;
    }
    for (int i=0; i<buttons.length; i++) {
      if (buttons[i].chosen) {
        out[c++] = i;
      }
    }
    return out;
  }
  private class Button {
    float r, c;
    String name;
    boolean chosen;
    Button(float r, float c, String name) {
      this.r = r;
      this.c = c;
      this.name = name;
      chosen = false;
    }
    void draw() {
      if (chosen) {
        fill(255, 0, 255);
      } else {
        fill(255);
      }
      rect(c, r, 80, 20, 5);
      fill(0);
      text(name, c+2, r+16);
    }
    void toggle() {
      chosen = !chosen;
    }
  }
}
class SubmitButton {
  float r, c, h, w;
  Menu parent;
  SubmitButton(float r, float c, float h, float w, Menu parent) {
    this.r = r;
    this.c = c;
    this.h = h;
    this.w = w;
    this.parent = parent;
  }
  void draw() {
    fill(255, 0, 255);
    rect(c, r, w, h, 5);
    fill(0);
    text("SUBMIT", c+75, r+h/2);
  }
  boolean mousePressed() {
    if (mouseX > c && mouseX < c+h &&
      mouseY > r && mouseY < r+h) {
      parent.exitMenu();
      return true;
    }
    return false;
  }
}
