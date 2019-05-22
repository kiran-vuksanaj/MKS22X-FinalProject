class CSVFile extends DataFile{
 String filename;
 Point[] points;
 CSVFile(String filename){
   BufferedReader r = createReader(filename);
   String[][] data = parseCSV(r,"the_geom");
   /*
   for(String[] row : data){
     printArray(row);
     println();
   }
   for(int i=0;i<data.length;i++){
     println(data[i][3]);
   }
   */
 }
 Point[] points(){
   return points;
 }
}
