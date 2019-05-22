class CSVFile extends DataFile{
 String filename;
 Point[] points;
 CSVFile(String filename){
   BufferedReader r = createReader(filename);
   String[][] data = parseCSV(r,"the_geom");
   points = new Point[data.length];
   for(int i=1;i<data.length;i++){//skipping header
     double[] coords = parsePoint(data[i][0]);
     printArray(coords);
     println();
   }
 }
 Point[] points(){
   return points;
 }
}
