class ResponseEntity {
  int _statusCode = 0;
  String _code = '';
  String _message = '';
  String _description = '';
  String _timestamp = '';
  List<dynamic> _results = [];

  ResponseEntity({statusCode, code, message, description, timestamp, results}) {
    _statusCode = statusCode;
    _code = code;
    _message = message;
    _description = description;
    _timestamp = timestamp;
    _results = results;
  }

  void setStatusCode(int value) {
    this._statusCode = value;
  }

  void setCode(String value) {
    this._code = value;
  }

  void setMessage(String value) {
    this._message = value;
  }

  void setDescription(String value) {
    this._description = value;
  }

  void setTimestamp() {
    this._timestamp = DateTime.now().toString();
  }

  void setResults(List<dynamic> value) {
    this._results.clear();
    this._results = value;
  }

  int getStatusCode() {
    return this._statusCode;
  }

  String getCode() {
    return this._code;
  }

  String getMessage() {
    return this._message;
  }

  String getDescription() {
    return this._description;
  }

  String getTimestamp() {
    return this._timestamp;
  }

  List<dynamic> getResults() {
    return this._results;
  }
}
