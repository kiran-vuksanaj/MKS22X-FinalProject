class CSVFile extends DataFile{
 String filename;
 String[] headers;
 BufferedReader reader;
 CSVFile(String filename){
   reader = createReader(filename);
   try{
     String firstLine = reader.readLine();
     headers = splitIgnore(firstLine,",","\"","\"");
   }catch(IOException e){
     throw new IllegalArgumentException("empty file");
   }
 }
 String[] getHeaders(){
   return headers;
 }
 void getData(int... cols){
   String[][] csv = parseCSV(reader,cols);
   data = new Point[csv.length-1];
   for(int i=1;i<csv.length;i++){//skipping header
     double[] coords = parsePoint(csv[i][0]);
     data[i-1] = new Point(coords,join(csv[i],"\n"));
   }
 }
 Point[] points(){
   return data;
 }
}
