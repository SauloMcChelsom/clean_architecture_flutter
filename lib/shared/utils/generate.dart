class Generate {
  String uid() {
    return new DateTime.now().millisecondsSinceEpoch.toString();
  }
}
