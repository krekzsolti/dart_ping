import 'package:dart_ping/src/models/ping_error.dart';
import 'package:dart_ping/src/models/ping_response.dart';
import 'package:dart_ping/src/models/ping_summary.dart';

/// Ping response data
class PingData {
  PingData({this.response, this.summary, this.error});

  /// A singly ping response from the target
  final PingResponse? response;

  /// A summary of results from previous ping responses
  final PingSummary? summary;

  /// An error reported by the ping process
  PingError? error;


  PingData.fromMap(Map map)
      : response = PingResponse.fromMap(map['pingResponse']),
        summary = PingSummary.fromMap(map['pingSummary']),
        error = PingError.fromMap(map['error']);

  Map toMap(){
    return{
      'response' : response!.toMap(),
      'summary' : summary!.toMap(),
      'error' : error?.toMap(),
    };
  }

  @override
  String toString() => summary == null
      ? error == null
          ? response.toString()
          : 'PingError(response:$response, error:$error)'
      : summary.toString();

}
