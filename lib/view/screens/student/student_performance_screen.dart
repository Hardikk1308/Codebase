// // import 'package:erp_school/testin_file.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:erp_school/data/models/response/student_performance_model.dart';
// // import 'package:erp_school/services/performance_service.dart';
// // import 'package:erp_school/view/base/custom_appbar.dart';
// // class StudentPerformanceScreen extends StatefulWidget {
// //   const StudentPerformanceScreen({super.key});
// //
// //   @override
// //   State<StudentPerformanceScreen> createState() => _StudentPerformanceScreenState();
// // }
// //
// // class _StudentPerformanceScreenState extends State<StudentPerformanceScreen> {
// //   late Future<StudentPerformanceModel> studentPerformanceFuture;
// //   final StudentPerformanceService _studentPerformanceService = StudentPerformanceService();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     studentPerformanceFuture = _studentPerformanceService.fetchStudentPerformanceSummary();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       //floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TestingFile()));}),
// //       backgroundColor: Colors.grey.shade200,
// //       appBar: CustomAppBar(title: 'Performance Report'.tr),
// //       body: FutureBuilder<StudentPerformanceModel>(
// //         future: studentPerformanceFuture,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (!snapshot.hasData) {
// //             return const Center(child: Text('No data available'));
// //           }
// //           final studentPerformance = snapshot.data!;
// //           final examTypes = studentPerformance.examTypes;
// //           return ListView.builder(
// //             padding: EdgeInsets.all(12),
// //             itemCount: examTypes.length,
// //             itemBuilder: (context, examIndex) {
// //               final examType = examTypes[examIndex];
// //
// //               return Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Container(
// //                     width: double.infinity,
// //                     padding: EdgeInsets.all(14),
// //                     decoration: BoxDecoration(
// //                       color: Colors.blue.shade700,
// //                       borderRadius: BorderRadius.circular(12),
// //                       boxShadow: [
// //                         BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
// //                       ],
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Icon(Icons.book, color: Colors.white, size: 18),
// //                         SizedBox(width: 10),
// //                         Text(
// //                           examType.examType.toUpperCase(),
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   // SizedBox(height: 10),
// //
// //                   // 📌 **Single Card with Header + Subject List**
// //                   Card(
// //                     elevation: 4,
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                     child: Padding(
// //                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
// //                       child: Column(
// //                         children: [
// //                           // 📌 **Table Header (Inside Card)**
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               Expanded(flex: 2, child: Text("Subject", style: headerStyle)),
// //                               Expanded(child: Text("Marks", style: headerStyle, textAlign: TextAlign.center)),
// //                               Expanded(child: Text("Total", style: headerStyle, textAlign: TextAlign.center)),
// //                             ],
// //                           ),
// //                           Divider(color: Colors.blue.shade300),
// //
// //                           // 📌 **Subjects and Marks List**
// //                           ListView.builder(
// //                             shrinkWrap: true,
// //                             physics: NeverScrollableScrollPhysics(),
// //                             itemCount: examType.examDetails.length,
// //                             itemBuilder: (context, subjectIndex) {
// //                               final subject = examType.examDetails[subjectIndex];
// //                               return Padding(
// //                                 padding: EdgeInsets.symmetric(vertical: 5),
// //                                 child: Row(
// //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                   children: [
// //                                     // **Subject Name**
// //                                     Expanded(
// //                                       flex: 2,
// //                                       child: Row(
// //                                         children: [
// //                                           Icon(Icons.menu_book, color: Colors.blue.shade700, size: 17),
// //                                           SizedBox(width: 5),
// //                                           Text(
// //                                             subject.subjectName,
// //                                             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                     ),
// //                                     // **Marks Obtained**
// //                                     Expanded(
// //                                       child: Text(
// //                                         "${subject.marksObtained}",
// //                                         textAlign: TextAlign.center,
// //                                         style: TextStyle(
// //                                           fontSize: 13,
// //                                           fontWeight: FontWeight.w600,
// //                                           color: Colors.green.shade700,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     // **Total Marks**
// //                                     Expanded(
// //                                       child: Text(
// //                                         "${subject.totalMarks}",
// //                                         textAlign: TextAlign.center,
// //                                         style: TextStyle(
// //                                           fontSize: 13,
// //                                           fontWeight: FontWeight.w600,
// //                                           color: Colors.red.shade700,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 15),
// //                 ],
// //               );
// //             },
// //           )
// //           ;
// //         },
// //       ),
// //     );
// //   }
// //
// //   TextStyle get headerStyle => TextStyle(
// //     fontSize: 13,
// //     fontWeight: FontWeight.bold,
// //     color: Colors.blue.shade900,
// //   );
// // }
//
// import 'dart:convert';
//
// import 'package:erp_school/services/login_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../data/models/response/student_performance_model.dart';
// import '../../base/custom_appbar.dart';
// import 'package:http/http.dart' as http;
//
// class StudentPerformanceScreen extends StatefulWidget {
//   const StudentPerformanceScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StudentPerformanceScreen> createState() =>
//       _StudentPerformanceScreenState();
// }
//
// class _StudentPerformanceScreenState extends State<StudentPerformanceScreen> {
//    Future<void> updateUserData(String type, Map<String, dynamic> updatedData) async {
//      // String baseUrl = 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/performance/student/SH1SD300S1/academicyear/2025-03-05/2025-01-01';
//      String baseUrl = 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/performance/student/SH1SD300S1/academicyear/';
//      String url = '$baseUrl/${_startedDate(context)}/${_endDate(context)}';
//
//      final headers = await LoginService.getHeaders();
//      final response = await http.put(
//        Uri.parse(url),
//        headers: headers,
//        body: jsonEncode(updatedData),
//      );
//
//      if (response.statusCode == 200) {
//        SnackBar(content: Text("Status updated successfully"));
//        print('User data updated successfully');
//      } else {
//        throw Exception('Failed to update user data: ${response.statusCode}');
//      }
//    }
//
//   DateTime startedDate = DateTime.now();
//   DateTime endDate = DateTime.now();
//
//   Future<void> _startedDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: startedDate,
//         firstDate: DateTime(8,2015),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != startedDate) {
//       setState(() {
//         startedDate = picked;
//       });
//     }
//   }
//   Future<void> _endDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: endDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != endDate) {
//       setState(() {
//         endDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Performance Report'.tr),
//       // body: Column(
//       //   crossAxisAlignment: CrossAxisAlignment.start,
//       //   children: [
//       //     Center(
//       //       child: Column(
//       //         mainAxisSize: MainAxisSize.min,
//       //         children: <Widget>[
//       //            SizedBox(
//       //             height: 20.0,
//       //           ),
//       //           // ),
//       //         ],
//       //       ),
//       //     ),
//       //     Row(
//       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //       children: [
//       //         Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: GestureDetector(
//       //             onTap: ()=> _startedDate(context),
//       //             child: Container(
//       //               height: 45,
//       //               width: 160,
//       //               decoration: BoxDecoration(
//       //                 border: Border.all(color: Colors.black),
//       //                 borderRadius: BorderRadius.circular(8)
//       //               ),
//       //               child: Padding(
//       //                 padding: const EdgeInsets.all(12.0),
//       //                 child: Center(child: Text("${startedDate.toLocal()}".split(' ')[0])),
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //         Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: GestureDetector(
//       //             onTap: ()=> _endDate(context),
//       //             child: Container(
//       //               height: 45,
//       //               width: 160,
//       //               decoration: BoxDecoration(
//       //                 border: Border.all(color: Colors.black),
//       //                 borderRadius: BorderRadius.circular(8),
//       //               ),
//       //               child: Padding(
//       //                 padding: const EdgeInsets.all(12.0),
//       //                 child: Center(child: Text("${endDate.toLocal()}".split(' ')[0])),
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ],
//       // ),
//       body: FutureBuilder<String, Map<String, dynamic>>(
//         // future: studentPerformanceFuture,
//         future: updateUserData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('No data available'));
//           }
//           final studentPerformance = snapshot.data!;
//           final examTypes = studentPerformance.examTypes;
//           return ListView.builder(
//             padding: EdgeInsets.all(12),
//             itemCount: examTypes.length,
//             itemBuilder: (context, examIndex) {
//               final examType = examTypes[examIndex];
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: ()=> _startedDate(context),
//                               child: Container(
//                                 height: 45,
//                                 width: 160,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.black),
//                                     borderRadius: BorderRadius.circular(8)
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Center(child: Text("${startedDate.toLocal()}".split(' ')[0])),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: ()=> _endDate(context),
//                               child: Container(
//                                 height: 45,
//                                 width: 160,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.black),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Center(child: Text("${endDate.toLocal()}".split(' ')[0])),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: Colors.blue.shade700,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.book, color: Colors.white, size: 18),
//                         SizedBox(width: 10),
//                         Text(
//                           examType.examType.toUpperCase(),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // SizedBox(height: 10),
//
//                   // 📌 **Single Card with Header + Subject List**
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
//                       child: Column(
//                         children: [
//                           // 📌 **Table Header (Inside Card)**
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(flex: 2, child: Text("Subject", style: headerStyle)),
//                               Expanded(child: Text("Marks", style: headerStyle, textAlign: TextAlign.center)),
//                               Expanded(child: Text("Total", style: headerStyle, textAlign: TextAlign.center)),
//                             ],
//                           ),
//                           Divider(color: Colors.blue.shade300),
//
//                           // 📌 **Subjects and Marks List**
//                           ListView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             itemCount: examType.examDetails.length,
//                             itemBuilder: (context, subjectIndex) {
//                               final subject = examType.examDetails[subjectIndex];
//                               return Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     // **Subject Name**
//                                     Expanded(
//                                       flex: 2,
//                                       child: Row(
//                                         children: [
//                                           Icon(Icons.menu_book, color: Colors.blue.shade700, size: 17),
//                                           SizedBox(width: 5),
//                                           Text(
//                                             subject.subjectName,
//                                             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     // **Marks Obtained**
//                                     Expanded(
//                                       child: Text(
//                                         "${subject.marksObtained}",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.green.shade700,
//                                         ),
//                                       ),
//                                     ),
//                                     // **Total Marks**
//                                     Expanded(
//                                       child: Text(
//                                         "${subject.totalMarks}",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.red.shade700,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                 ],
//               );
//             },
//           )
//           ;
//         },
//       ),
//     );
//   }
//
//   TextStyle get headerStyle => TextStyle(
//     fontSize: 13,
//     fontWeight: FontWeight.bold,
//     color: Colors.blue.shade900,
//   );
//    );
//   }
// }

// import 'dart:convert';
// import 'package:erp_school/services/login_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../data/models/response/student_performance_model.dart';
// import '../../base/custom_appbar.dart';
// import 'package:http/http.dart' as http;
//
// class StudentPerformanceScreen extends StatefulWidget {
//   const StudentPerformanceScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StudentPerformanceScreen> createState() =>
//       _StudentPerformanceScreenState();
// }
//
// class _StudentPerformanceScreenState extends State<StudentPerformanceScreen> {
//   Future<void> updateUserData(String type, Map<String, dynamic> updatedData) async {
//     // String baseUrl = 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/performance/student/SH1SD300S1/academicyear/2025-03-05/2025-01-01';
//     String baseUrl = 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/performance/student/SH1SD300S1/academicyear/';
//     String url = '$baseUrl/${getstartedDate()}/${getendDate()}';
//
//     final headers = await LoginService.getHeaders();
//     final response = await http.put(
//       Uri.parse(url),
//       headers: headers,
//       body: jsonEncode(updatedData),
//     );
//
//     if (response.statusCode == 200) {
//       SnackBar(content: Text("Status updated successfully"));
//       print('User data updated successfully');
//     } else {
//       throw Exception('Failed to update user data: ${response.statusCode}');
//     }
//   }
//   String getstartedDate() {
//     return "${startedDate.year}-${startedDate.month.toString().padLeft(2, '0')}-${startedDate.day.toString().padLeft(2, '0')}";
//   }
//
//   String getendDate() {
//     return "${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}";
//   }
//
//   DateTime startedDate = DateTime.now();
//   DateTime endDate = DateTime.now();
//
//   Future<void> _startedDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: startedDate,
//         firstDate: DateTime(8,2015),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != startedDate) {
//       setState(() {
//         startedDate = picked;
//       });
//     }
//   }
//   Future<void> _endDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: endDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != endDate) {
//       setState(() {
//         endDate = picked;
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Performance Report'.tr),
//       body: FutureBuilder<void>(
//         // future: studentPerformanceFuture,
//         future: updateUserData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('No data available'));
//           }
//           final studentPerformance = snapshot.data!;
//           final examTypes = studentPerformance.examTypes;
//           return ListView.builder(
//             padding: EdgeInsets.all(12),
//             itemCount: examTypes.length,
//             itemBuilder: (context, examIndex) {
//               final examType = examTypes[examIndex];
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: ()=> _startedDate(context),
//                               child: Container(
//                                 height: 45,
//                                 width: 160,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.black),
//                                     borderRadius: BorderRadius.circular(8)
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Center(child: Text("${startedDate.toLocal()}".split(' ')[0])),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: ()=> _endDate(context),
//                               child: Container(
//                                 height: 45,
//                                 width: 160,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.black),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Center(child: Text("${endDate.toLocal()}".split(' ')[0])),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: Colors.blue.shade700,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.book, color: Colors.white, size: 18),
//                         SizedBox(width: 10),
//                         Text(
//                           examType.examType.toUpperCase(),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // SizedBox(height: 10),
//
//                   // 📌 **Single Card with Header + Subject List**
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
//                       child: Column(
//                         children: [
//                           // 📌 **Table Header (Inside Card)**
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(flex: 2, child: Text("Subject", style: headerStyle)),
//                               Expanded(child: Text("Marks", style: headerStyle, textAlign: TextAlign.center)),
//                               Expanded(child: Text("Total", style: headerStyle, textAlign: TextAlign.center)),
//                             ],
//                           ),
//                           Divider(color: Colors.blue.shade300),
//
//                           // 📌 **Subjects and Marks List**
//                           ListView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             itemCount: examType.examDetails.length,
//                             itemBuilder: (context, subjectIndex) {
//                               final subject = examType.examDetails[subjectIndex];
//                               return Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     // **Subject Name**
//                                     Expanded(
//                                       flex: 2,
//                                       child: Row(
//                                         children: [
//                                           Icon(Icons.menu_book, color: Colors.blue.shade700, size: 17),
//                                           SizedBox(width: 5),
//                                           Text(
//                                             subject.subjectName,
//                                             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     // **Marks Obtained**
//                                     Expanded(
//                                       child: Text(
//                                         "${subject.marksObtained}",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.green.shade700,
//                                         ),
//                                       ),
//                                     ),
//                                     // **Total Marks**
//                                     Expanded(
//                                       child: Text(
//                                         "${subject.totalMarks}",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.red.shade700,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                 ],
//               );
//             },
//           )
//           ;
//         },
//       ),
//     );
//   }
//
//   TextStyle get headerStyle => TextStyle(
//     fontSize: 13,
//     fontWeight: FontWeight.bold,
//     color: Colors.blue.shade900,
//   );
//   );
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/login_service.dart';

class StudentPerformanceScreen extends StatefulWidget {
  @override
  _StudentPerformanceScreenState createState() => _StudentPerformanceScreenState();
}

class _StudentPerformanceScreenState extends State<StudentPerformanceScreen> {
  DateTime startedDate = DateTime.now();
  DateTime endDate = DateTime.now();
  late Future<List<ExamType>> studentPerformanceFuture;

  @override
  void initState() {
    super.initState();
    studentPerformanceFuture = fetchStudentPerformance();
  }

  Future<List<ExamType>> fetchStudentPerformance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String baseUrl = 'https://www.sutramsol.in/ssapigw-dev/academic-dev/api/v1/performance/student/$savedUsername/academicyear';
    String url = '$baseUrl/${getstartedDate()}/${getendDate()}';

    final headers = await LoginService.getHeaders();
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      if (jsonData is Map<String, dynamic>) {
        List<dynamic> examList = jsonData['examTypes'];
        return examList.map((e) => ExamType.fromJson(e)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load student performance');
    }
  }


  String getstartedDate() {
    return "${startedDate.year}-${startedDate.month.toString().padLeft(2, '0')}-${startedDate.day.toString().padLeft(2, '0')}";
  }

  String getendDate() {
    return "${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}";
  }

  Future<void> _pickDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startedDate : endDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startedDate = picked;
        } else {
          endDate = picked;
        }
      });

      // After change date hit the api **
      studentPerformanceFuture = fetchStudentPerformance();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Performance Report'),automaticallyImplyLeading: false,leading: GestureDetector( onTap: Get.back, child: Icon(Icons.arrow_back_ios_new)),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDatePicker("Start Date", startedDate, () => _pickDate(context, true)),
                _buildDatePicker("End Date", endDate, () => _pickDate(context, false)),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ExamType>>(
              future: studentPerformanceFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                }
                final examTypes = snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: examTypes.length,
                  itemBuilder: (context, examIndex) {
                    final examType = examTypes[examIndex];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.book, color: Colors.white, size: 18),
                                  SizedBox(width: 10),
                                  Text(
                                    examType.examType.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(flex: 2, child: Text("Subject", style: headerStyle)),
                                    Expanded(child: Text("Marks", style: headerStyle, textAlign: TextAlign.center)),
                                    Expanded(child: Text("Total", style: headerStyle, textAlign: TextAlign.center)),
                                  ],
                                ),
                                Divider(color: Colors.blue.shade300),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: examType.examDetails.length,
                                  itemBuilder: (context, subjectIndex) {
                                    final subject = examType.examDetails[subjectIndex];
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Icon(Icons.menu_book, color: Colors.blue.shade700, size: 17),
                                                SizedBox(width: 5),
                                                Text(subject.subjectName, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${subject.marksObtained}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.green.shade700),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${subject.totalMarks}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.red.shade700),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker(String label, DateTime date, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 160,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text("${date.toLocal()}".split(' ')[0])),
      ),
    );
  }

  TextStyle get headerStyle => TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: Colors.blue.shade900,
  );
}

class ExamType {
  final String examType;
  final List<ExamDetails> examDetails;

  ExamType({required this.examType, required this.examDetails});

  factory ExamType.fromJson(Map<String, dynamic> json) {
    var list = json['examDetails'] as List;
    List<ExamDetails> detailsList = list.map((i) => ExamDetails.fromJson(i)).toList();

    return ExamType(
      examType: json['examType'],
      examDetails: detailsList,
    );
  }
}

class ExamDetails {
  final String subjectName;
  final int marksObtained;
  final int totalMarks;

  ExamDetails({required this.subjectName, required this.marksObtained, required this.totalMarks});

  factory ExamDetails.fromJson(Map<String, dynamic> json) {
    return ExamDetails(
      subjectName: json['subjectName'],
      marksObtained: json['marksObtained'],
      totalMarks: json['totalMarks'],
    );
  }
}
