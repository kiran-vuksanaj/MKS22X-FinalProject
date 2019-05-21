Map m;
void setup() {
  m = new Map(null,"baseFiles/NTA.csv");
  /*
  for(Neighborhood n : m.regions()){
    println(n.toStringCoords());
  }
  */
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
  boolean identicalDelims = open.equals(close);
  int depth = 0;
  ArrayList<String> out = new ArrayList<String>();
  int prevIndex = 0;
  for(int i=0;i<str.length();i++){
    if(depth==0 && i+split.length() < str.length() && str.substring(i,i+split.length()).equals(split)){
      out.add(str.substring(prevIndex,i));
      prevIndex = i + split.length();
      i += split.length() - 1;
    }else{
      if(i+open.length() < str.length() && str.substring(i,i+open.length()).equals(open)){
        depth++;
        i += open.length() - 1;
      }else if(i+close.length() < str.length() && str.substring(i,i+close.length()).equals(close)){
        depth--;
        i += close.length() - 1;
      }
      if(identicalDelims) depth %= 2;
    }
  }
  out.add(str.substring(prevIndex,str.length()));
  String[] useless = new String[0];
  return out.toArray(useless);
}
static double[][][][] parseMultiPolygon(String str){
  //remove outer layer guck
  str = str.substring("MULTIPOLYGON (".length(),str.length()-1);
  println(endsOf(str));
  String[] split = splitIgnore(str,",","(",")");
  double[][][][] out = new double[split.length][][][];
  for(int i=0;i<split.length;i++){
    split[i] = trim(split[i]);
    split[i] = split[i].substring(1,split[i].length()-1);
    println("\t",endsOf(split[i]);
    String[] splitB = splitIgnore(split[i],",","(",")");
    out[i] = new double[splitB.length][][];
    for(int j=0;j<splitB.length;j++){
      splitB[j] = trim(splitB[j]);
      splitB[j] = splitB[j].substring(1,splitB[j].length()-1);
      println("\t\t",endsOf(splitB[j]));
      String[] splitC = split(splitB[j],',');
      out[i][j] = new double[splitC.length][];
      for(int k=0;k<splitC.length;k++){
        splitC[k] = trim(splitC[k]);
        splitC[k] = splitC[k].substring(1,splitC[k].length()-1);
        println("\t\t\t",endsOf(splitC[k]));
        out[i][j][k] = new double[2];
        String[] splitCoords = split(splitC[k],' ');
        
        out[i][j][k][0] = Double.parseDouble(splitCoords[0]);
        out[i][j][k][1] = Double.parseDouble(splitCoords[1]);
      }
    }
  }
  return out;
}
static String endsOf(String str){
  return str.substring(0,10)+" ... "+str.substring(str.length()-10);
}
