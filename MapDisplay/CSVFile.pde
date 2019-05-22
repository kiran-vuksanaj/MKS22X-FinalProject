class CSVFile extends DataFile{
 String filename;
 Point[] points;
 CSVFile(String filename){
   BufferedReader r = createReader(filename);
   String[][] data = parseCSV(r,"the_geom");
   for(int i=0;i<data[0].length;i++){
     println(data[0][i]);
   }
 }
 Point[] points(){
   return points;
 }
}
