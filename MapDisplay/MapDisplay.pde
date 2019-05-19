void setup() {
}
void draw() {
}


//STATIC METHODS
static String[][] parseCSV(BufferedReader reader, int... cols) {
  ArrayList<String> lines = new ArrayList<String>();
  try{
    String line = reader.readLine();
    while(line != null){//while not at last line
      lines.add(line);
      //println(line);
      try{
        line = reader.readLine();
      }catch(IOException e){
        line = null;
      }
    }
    String[][] out = new String[lines.size()][];
    for(int i = 0;i<out.length;i++){
      out[i] = new String[cols.length];
      String[] split = splitIgnoringInQuotes(lines.get(i));
      for(int j = 0;j<cols.length;j++){
        out[i][j] = split[cols[j]];
      }
    }
    return out;
  }catch(IOException e){
    e.printStackTrace();
    throw new IllegalArgumentException();
  }
}
static String[] splitIgnoringInQuotes(String line){
  String[] init = split(line,'"');
  //printArray(init);
  int i = 1;
  String[] temps = new String[init.length/2];
  for(int c=0;i<init.length;i+=2){
    temps[c++] = init[i];
    init[i] = "%%INQuotes%%";
  }
  line = join(init,'"');
  String[] out = split(line,',');
  int c = 0;
  for(int j=0;j<out.length;j++){
    if(out[j].equals("\"%%INQuotes%%\"")){
      println(out[j]);
      println(temps[c]);
      out[j] = temps[c++];
      println(out[j]+"\n");
    }
  }
  return out;
}
