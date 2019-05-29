abstract class DataFile{
  String filename;
  Point[] data;
  abstract Point[] points();
  abstract String[] getHeaders();
}
