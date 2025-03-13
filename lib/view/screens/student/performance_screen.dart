//
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:erp_school/view/base/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class PerformanceScreen extends StatefulWidget {
//   const PerformanceScreen({super.key});
//
//   @override
//   State<PerformanceScreen> createState() => _PerformanceScreenState();
// }
//
// class _PerformanceScreenState extends State<PerformanceScreen> {
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).highlightColor,
//       appBar: CustomAppBar(
//         title: 'performance'.tr,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 450,
//
//               child: Theme(
//                 data: Theme.of(context).copyWith(
//                   scrollbarTheme: ScrollbarThemeData(
//                     thumbColor: MaterialStateProperty.all(Theme.of(context).primaryColor), // Thumb color
//                     trackColor: MaterialStateProperty.all(Colors.grey.shade300), // Track color
//                     trackBorderColor: MaterialStateProperty.all(Colors.grey.shade400), // Optional: Track border color
//                   ),
//                 ),
//                 child: Scrollbar(
//                   thumbVisibility: true, // Ensures the scrollbar is always visible
//                   trackVisibility: true,
//                   thickness: 8.0, // Optional: Adjust scrollbar thickness
//                   radius: Radius.circular(8.0),
//                   controller: _scrollController, // Attach controller to Scrollbar
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     controller: _scrollController, // Attach controller to SingleChildScrollView
//                     child: Container(
//                       color: Color(0xffF9FCFF),
//                       child: Table(
//                         border: TableBorder.all(),
//                         defaultColumnWidth: FixedColumnWidth(120.0),
//                         children: [
//                           TableRow(
//                             decoration: BoxDecoration(color: Colors.blueAccent),
//                             children: [
//                               _buildTableHeader('Subject'),
//                               _buildTableHeader('Unit Test'),
//                               _buildTableHeader('Class Test'),
//                               _buildTableHeader('Midterm'),
//                               _buildTableHeader('Annual Exam'),
//                               _buildTableHeader('Final Exam'),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               _buildTableCell('English'),
//                               _buildTableCell('47/50'),
//                               _buildTableCell('48/50'),
//                               _buildTableCell('50/50'),
//                               _buildTableCell('44/50'),
//                               _buildTableCell('45/50'),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               _buildTableCell('Hindi'),
//                               _buildTableCell('47/50'),
//                               _buildTableCell('48/50'),
//                               _buildTableCell('50/50'),
//                               _buildTableCell('44/50'),
//                               _buildTableCell('45/50'),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               _buildTableCell('Math'),
//                               _buildTableCell('47/50'),
//                               _buildTableCell('48/50'),
//                               _buildTableCell('50/50'),
//                               _buildTableCell('44/50'),
//                               _buildTableCell('45/50'),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               _buildTableCell('Social Studies'),
//                               _buildTableCell('47/50'),
//                               _buildTableCell('48/50'),
//                               _buildTableCell('50/50'),
//                               _buildTableCell('44/50'),
//                               _buildTableCell('45/50'),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               _buildTableCell('Computer Science'),
//                               _buildTableCell('47/50'),
//                               _buildTableCell('48/50'),
//                               _buildTableCell('50/50'),
//                               _buildTableCell('44/50'),
//                               _buildTableCell('45/50'),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               _buildTableCell('Geography'),
//                               _buildTableCell('47/50'),
//                               _buildTableCell('48/50'),
//                               _buildTableCell('50/50'),
//                               _buildTableCell('44/50'),
//                               _buildTableCell('45/50'),
//                             ],
//                           ),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 50,),
//             CustomButton(
//               height: 50,
//               fontSize: 14,
//               color: true,
//               radius: 50,
//               title: 'download_report_card'.tr,
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTableHeader(String text) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             text,
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTableCell(String text) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             text,
//             textAlign: TextAlign.center,
//             style: interSemiBold.copyWith(fontSize: 14,color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
