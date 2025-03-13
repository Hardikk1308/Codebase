import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http_pkg;
import 'package:http_interceptor/http/intercepted_http.dart';
import 'package:uuid/uuid.dart';
// import 'package:ua_client_hints/ua_client_hints.dart';
import 'http_interceptor.dart';
// import 'package:device_info_plus/device_info_plus.dart';
class ApiUtil {

  static final http = InterceptedHttp.build(interceptors: [
    HttpInterceptor(),
  ]);


  static Future<Map<String, String>> getHeaders() async {
    var correlationObject = {
      'correlation-id': Uuid().v4(),  // Generate UUID
     // 'timestamp': DateTime.now().millisecondsSinceEpoch,  // Current timestamp in milliseconds
    };

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
      'X-Correlation-Id': jsonEncode(correlationObject),
      "Sec-CH-UA-Mobile": Platform.isAndroid || Platform.isIOS ? "1" : "0",
      "Sec-CH-UA-Platform": Platform.operatingSystem,
      "Sec-CH-UA-Platform-Version": Platform.operatingSystemVersion,
      // "Sec-CH-UA-Platform-Version": Platform.numberOfProcessors,
     // "X-Android-Version": androidVersion,
    };
  }
  // Static method for GET request
  static Future<http_pkg.Response> getRequest(String url) async {
    //
    // try {
    //   final headers = await getHeaders();
    //   final response = await http.get(Uri.parse(url), headers: headers);
    //
    //   if (response.statusCode >= 200 && response.statusCode < 300) {
    //     return response;
    //   } else if (response.statusCode == 404) {
    //     print("MyResponse::${response.body}");
    //     return response;
    //   } else {
    //     print("MyResponse::${response.body}");
    //     throw Exception(
    //         'Failed GET request with status code: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   rethrow;
    // }
    try {
      final headers = await getHeaders();
      final response = await http.get(Uri.parse(url), headers: headers);

      print("MyResponse Status Code:: ${response.statusCode}");
      print("MyResponse Body:: ${response.body}");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else if (response.statusCode == 404) {
        print("MyResponse::${response.body}");
        return response;
      } else {
        print("MyResponse::${response.body}");
        throw Exception(
            'Failed GET request with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in GET request: $e");
      rethrow;
    }

  }

  // Static method for POST request
  static Future<http_pkg.Response> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      final headers = await getHeaders();
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        throw Exception(
            'Failed POST request with status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
