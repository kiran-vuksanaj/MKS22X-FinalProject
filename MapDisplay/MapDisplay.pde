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
      try{
        line = reader.readLine();
      }catch(IOException e){
        line = null;
      }
    }
    String[][] out = new String[lines.size()][cols.length];
    for(int i = 0;i<out.length;i++){
      String[] split = splitIgnoringInQuotes(line);
      for(int j = 0;j<cols.length;j++){
        split[cols[j]] = out[i][j];
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
  int i = 1;
  String[] temps = new String[init.length/2];
  for(int c=0;i<init.length;i+=2){
    temps[c++] = init[i];
    init[i] = "%%INQuotes%%";
  }
  line = join(init,'"');
  String[] out = split(line,',');
  int c = 0;
  for(int j=0;i<out.length;j++){
    if(out[i].contains("%%INQuotes%%")){
      out[i].replace("%%INQuotes%%",temps[c++]);//careful! more than one?
    }
  }
  return out;
}
