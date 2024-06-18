//未登录异常
class UnLoginException implements Exception {
  final String message;

  UnLoginException(this.message);
}

//其他异常
class OtherException implements Exception {
  final String message;

  OtherException(this.message);
}
