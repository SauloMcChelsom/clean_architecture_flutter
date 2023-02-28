class ResponseEntity {
  final int statusCode;
  final String code;
  final String message;
  final String description;
  final String timestamp;
  final List<dynamic> results;

  ResponseEntity(
      {required this.statusCode,
      required this.code,
      required this.message,
      required this.description,
      required this.timestamp,
      required this.results});
}
