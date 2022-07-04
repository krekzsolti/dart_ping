/// Error code
class PingError {
  PingError(this.error, {this.message});

  final ErrorType error;
  final String? message;


  PingError.fromMap(Map map)
      : message = map['message'],
        error = map['error'];

  Map toMap(){
    return{
      'message' : message,
      'error' : error,
    };
  }

  String get _errorStr =>
      error.toString().substring(error.toString().indexOf('.') + 1);

  @override
  String toString() =>
      message == null ? _errorStr.toString() : '$_errorStr: $message';
}

enum ErrorType { RequestTimedOut, UnknownHost, Unknown, NoReply }
