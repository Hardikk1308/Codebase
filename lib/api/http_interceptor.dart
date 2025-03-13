
import 'package:http/http.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

class HttpInterceptor extends InterceptorContract {
  static const TAG = "shiksha-logger";

  adebug(dynamic message) {
    print("[$TAG] : $message");
  }

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    adebug('----- Request -----');
    adebug(request.toString());
    adebug(request.headers.toString());
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    adebug('----- Response -----');
    adebug('Code: ${response.statusCode}');
    if (response is Response) {
      adebug((response).body);
    }
    return response;
  }
}