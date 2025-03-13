// import 'dart:convert';
//
// import 'package:erp_school/api/api_util.dart' as api;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../data/models/response/School_model.dart';
// import '../data/models/response/attendance_model.dart';
// //
// class SchoolService {
//
//   static Future<int?> getSchoolId() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("get School idss : ${prefs.getInt("selectedSchoolId")}");
//     return prefs.getInt("selectedSchoolId");
//     // print()
//   }
//   // Future<String?> getUserType() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   return prefs.getString('type');
//   // }
//   static Future<String?> getUserType() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("get School idss : ${prefs.getInt("selectedSchoolId")}");
//     return prefs.getString('type');
//     // print()
//   }
//
//   Future<List<SchoolModel>> fetchSchool() async {
//     const url = 'http://sutramsol.in/ssapigw-dev/onboard-dev/api/v1/schools';
//     final response = await api.ApiUtil.getRequest(url);
//     print("The response is Schools: ${response.body}");
//
//     if (response.statusCode == 200) {
//       // Decode the JSON response
//       final List<dynamic> jsonData = json.decode(response.body);
//
//       // Map the JSON list to a list of SchoolModel objects
//       print("Response select school: ${response.body}");
//       final List<SchoolModel> schools =
//           jsonData.map((school) => SchoolModel.fromJson(school)).toList();
//
//       return schools;
//     } else {
//       throw Exception('Failed to load schools: ${response.statusCode}');
//     }
//   }
// }
// // import '../data/models/response/School_model.dart';
// //
// // class SchoolService {
// //   static Future<int?> getSchoolId() async {
// //     SchoolService schoolService = SchoolService();
// //     try {
// //       List<SchoolModel> schools = await schoolService.fetchSchool();
// //       for (var school in schools) {
// //         print('print School ID: ${school.schoolId}');
// //       }
// //       if (schools.isNotEmpty) {
// //         return schools.first.schoolId;
// //       }
// //       print('No schools found.');
// //       return null;
// //     } catch (e) {
// //       print('Error fetching schools: $e');
// //       return null;
// //     }
// //   }
// //
// //   Future<List<SchoolModel>> fetchSchool() async {
// //     const url = 'http://sutramsol.in/ssapigw/onboard/api/v1/schools';
// //     try {
// //       final response = await api.ApiUtil.getRequest(url);
// //       if (response.statusCode == 200) {
// //         final List<dynamic> jsonData = json.decode(response.body);
// //         return jsonData.map((school) => SchoolModel.fromJson(school)).toList();
// //       } else {
// //         throw Exception('Failed to fetch schools: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       throw Exception('Error fetching schools: $e');
// //     }
// //   }
// // }
import 'dart:convert';

import 'package:erp_school/api/api_util.dart' as api;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/response/School_model.dart';
//
class SchoolService {

  static Future<int?> getSchoolId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("get School idss : ${prefs.getInt("selectedSchoolId")}");
    return prefs.getInt("selectedSchoolId");
    // print()
  }
  // Future<String?> getUserType() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('type');
  // }
  static Future<String?> getUserType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Abhi :- get School idss : ${prefs.getInt("selectedSchoolId")}");
    return prefs.getString('type');
    // print()
  }

  Future<List<SchoolModel>> fetchSchool() async {
    const url = 'http://sutramsol.in/ssapigw-dev/onboard-dev/api/v1/schools';
    final response = await api.ApiUtil.getRequest(url);
    print("The response is Schools: ${response.body}");

    if (response.statusCode == 200) {
      // Directly decode list, kyunki response ek list hai
      final List<dynamic> jsonData = json.decode(response.body);

      // List ko SchoolModel objects me convert karo
      // final List<SchoolModel> schools =
      // jsonData.map((school) => SchoolModel.fromJson(school)).toList();
      final List<SchoolModel> schools =
      jsonData.map((school) => SchoolModel.fromJson(school)).toList();
      return schools;
    } else {
      throw Exception('Failed to load schools: ${response.statusCode}');
    }
  }
  // Future<List<SchoolModel>> fetchSchool() async {
  //   const url = 'http://sutramsol.in/ssapigw-dev/onboard-dev/api/v1/schools';
  //   final response = await api.ApiUtil.getRequest(url);
  //   print("The response is Schools: ${response.body}");
  //
  //   if (response.statusCode == 200) {
  //     // final Map<String, dynamic> jsonData = json.decode(response.body);
  //     final Map<String, dynamic> jsonData = json.decode(response.body);
  //
  //     // ✅ Extract 'schoolNameList' which is actually the list
  //     final List<dynamic> schoolList = jsonData['schoolNameList'];
  //
  //     // ✅ Convert each item in the list to SchoolModel
  //     final List<SchoolModel> schools =
  //     schoolList.map((school) => SchoolModel.fromJson(school)).toList();
  //
  //     return schools;
  //   } else {
  //     throw Exception('Failed to load schools: ${response.statusCode}');
  //   }
  // }



}
