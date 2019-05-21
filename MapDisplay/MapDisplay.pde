Map m;
void setup() {
  m = new Map(null,"baseFiles/NTA.csv");
  for(Neighborhood n : m.regions()){
    //println(n.toStringCoords());
  }
  //size(461, 570);
  size(1000, 800);
  background(50, 140, 200);
}
void draw() {
  m.draw();
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
      String[] split = splitIgnore(lines.get(i),",","\"","\"");
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
static String[] splitIgnore(String str,String split,String open,String close){
  String[] out = split(str,open);
  str = join(out,"%%DELIM%%");
  out = split(str,close);
  str = join(out,"%%DELIM%%");
  out = split(str,"%%DELIM%%");
  String[] temps = new String[out.length/2];
  for(int i=0;i<temps.length;i++){
    temps[i] = out[i*2+1];
    out[i*2+1] = "%%IGNORE%%";
  }
  str = join(out,"");
  out = split(str,split);
  int c = 0;
  for(int i=0;i<out.length;i++){
    out[i] = trim(out[i]);
    if(out[i].equals("%%IGNORE%%")){
      out[i] = temps[c++];
    }
  }
  return out;
}
static double[][][][] parseMultiPolygon(String str){
  //remove outer layer guck
  str = str.substring("MULTIPOLYGON (".length(),str.length()-1);
  String[] split = splitIgnore(str,",","(",")");
  double[][][][] out = new double[split.length][][][];
  for(int i=0;i<split.length;i++){
    String[] splitB = splitIgnore(split[i],",","(",")");
    out[i] = new double[splitB.length][][];
    for(int j=0;j<splitB.length;j++){
      String[] splitC = split(splitB[j],',');
      out[i][j] = new double[splitC.length][];
      for(int k=0;k<splitC.length;k++){
        out[i][j][k] = new double[2];
        String[] splitCoords = split(splitC[k],' ');
        out[i][j][k][0] = Double.parseDouble(splitCoords[0]);
        out[i][j][k][1] = Double.parseDouble(splitCoords[1]);
      }
    }
  }
  return out;
}
