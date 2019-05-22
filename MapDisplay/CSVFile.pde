class CSVFile extends DataFile{
 String filename;
 Point[] points;
 CSVFile(String filename){
   BufferedReader r = createReader(filename);
   String[][] data = parseCSV(r,"the_geom");
   for(int i=0;i<data.length;i++){
     println(data[i][0]);
   }
 }
 Point[] points(){
   return points;
 }
}
