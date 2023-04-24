class HttpException implements Exception {
  final String msg;
  final int stateCode;

  HttpException({
    required this.msg,
    required this.stateCode,
  });

  @override
  String toString() {
    return msg;
  }
}
