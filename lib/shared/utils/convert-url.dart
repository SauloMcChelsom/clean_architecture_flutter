import 'dart:math';

class Text {
  String extensionFile(String text) {
    return text.split(".")[1];
  }

  int timestamp(String text) {
    String t1 = text.split("_")[1];
    return int.parse(t1.split(".")[0]);
  }

  String namefile(String text) {
    return text.split("_")[0];
  }

  int timestampMax(List<int> values) {
    return values.reduce(max);
  }
}
