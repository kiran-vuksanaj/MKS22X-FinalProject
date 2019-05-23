class CSVFile extends DataFile{
 String filename;
 CSVFile(String filename){
   BufferedReader r = createReader(filename);
   String[][] csv = parseCSV(r,"the_geom");
   data = new Point[csv.length-1];
   for(int i=1;i<csv.length;i++){//skipping header
     double[] coords = parsePoint(csv[i][0]);
     data[i-1] = new Point(coords,"");
   }
 }
 Point[] points(){
   return data;
 }
}
