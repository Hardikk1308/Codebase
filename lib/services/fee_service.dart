import 'dart:convert';
import 'package:erp_school/api/api_util.dart';
import 'package:erp_school/constants/app_constants.dart';
import 'package:erp_school/data/models/response/fee_details.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeeService {



  Future<FeeDetails> fetchFeeDetails() async {
    try {
      // Get the saved username from SharedPreferences
      int currentYear = DateTime.now().year;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedUsername = prefs.getString('username');
      print('The saved use name --> $savedUsername');
      final yearDate = DateFormat("yyyy").format(DateTime.now());
      final String apiUrl = "$apiBaseUrl$academicPrefix/fees/student/$savedUsername/$yearDate";
      final response = await ApiUtil.getRequest(apiUrl); // await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        var feeDetails = FeeResponse.fromJson(data);
        return feeDetails.feeDetails;
      } else {
        throw Exception("Failed to load fee details");
      }
    } catch (e) {
      print("The Error is $e");
      throw Exception("Error: $e");
    }
  }
}
