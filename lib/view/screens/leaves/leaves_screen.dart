// import 'package:erp_school/themes/light.dart';
// import 'package:erp_school/utils/dimensions.dart';
// import 'package:erp_school/utils/images.dart';
// import 'package:erp_school/utils/styles.dart';
// import 'package:erp_school/view/base/custom_appbar.dart';
// import 'package:erp_school/view/base/custom_button.dart';
// import 'package:erp_school/view/base/custom_dropdown.dart';
// import 'package:erp_school/view/screens/homework/homework.dart';
// import 'package:erp_school/view/screens/leaves/leave_form_screen.dart';
// import 'package:erp_school/view/screens/leaves/request_leaves.dart';
// import 'package:erp_school/view/screens/teacher/mark_attendance_screen.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:get/get.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
// import 'package:table_calendar/table_calendar.dart';
//
//
// class LeavesScreen extends StatefulWidget {
//   const LeavesScreen({super.key});
//
//   @override
//   State<LeavesScreen> createState() => _LeavesScreenState();
// }
//
// class _LeavesScreenState extends State<LeavesScreen> {
//   List<DropdownItem<int>> dmTypeList = [];
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).cardColor,
//       appBar: CustomAppBar(
//         title: 'leaves'.tr,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 12),
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               20.h,
//               Container(
//                 height: Get.height / 2,
//                 width: Get.width,
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Theme.of(context).cardColor,
//                   boxShadow: [customBoxShadow()],
//
//                 ),
//                 child:CalendarCarousel<Event>(
//
//                   onDayPressed: (DateTime date, List<Event> events) {
//                     // Handle date selection
//                     print("Selected Date: $date");
//                   },
//                   weekendTextStyle: interSemiBold.copyWith(
//                       color: Theme.of(context).disabledColor,
//                       fontSize: 12
//                   ),
//                   weekdayTextStyle: interSemiBold.copyWith(
//                       fontSize: 11,
//                       color: Theme.of(context).disabledColor
//                   ),
//                   selectedDayBorderColor: Colors.blue,
//                   selectedDayButtonColor: Colors.blue,
//                   todayBorderColor: Colors.black,
//                   todayButtonColor: Colors.black,
//                   daysHaveCircularBorder: true,
//                   showOnlyCurrentMonthDate: true,
//                   headerTextStyle: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   iconColor: Colors.black,
//                   headerMargin: EdgeInsets.symmetric(vertical: 10),
//                 ),
//               ),
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: Container(
//             //     decoration: BoxDecoration(
//             //       //border: Border.all(color: Colors.black, width: 1), // Outer border
//             //     ),
//             //     child: TableCalendar(
//             //       firstDay: DateTime.utc(2020, 1, 1),
//             //       lastDay: DateTime.utc(2030, 12, 31),
//             //       focusedDay: _focusedDay,
//             //       calendarFormat: CalendarFormat.month,
//             //       selectedDayPredicate: (day) {
//             //         return isSameDay(_selectedDay, day);
//             //       },
//             //       onDaySelected: (selectedDay, focusedDay) {
//             //         setState(() {
//             //           _selectedDay = selectedDay;
//             //           _focusedDay = focusedDay;
//             //         });
//             //       },
//             //
//             //       calendarStyle: CalendarStyle(
//             //         tableBorder: TableBorder.all(color: Colors.grey, width: 1), // Grid lines
//             //         selectedDecoration: BoxDecoration(
//             //           color: Colors.blue,
//             //           shape: BoxShape.rectangle,
//             //           borderRadius: BorderRadius.circular(2),
//             //         ),
//             //         todayDecoration: BoxDecoration(
//             //           color: Colors.blueAccent.withOpacity(0.5),
//             //           shape: BoxShape.rectangle,
//             //           borderRadius: BorderRadius.circular(5),
//             //         ),
//             //         outsideDaysVisible: false,
//             //       ),
//             //       headerStyle: HeaderStyle(
//             //         formatButtonVisible: false,
//             //         titleCentered: true,
//             //         titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             //         leftChevronIcon: Icon(Icons.chevron_left),
//             //         rightChevronIcon: Icon(Icons.chevron_right),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//
//               30.h,
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
//                 height: 40,
//                 width: Get.width / 1.75,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(15),
//                         topRight: Radius.circular(15)),
//                     color: Theme.of(context).primaryColor,
//                     boxShadow: [customBoxShadow()]),
//                 child: Text(
//                   'my_leaves_record'.tr,
//                   style: interMedium.copyWith(
//                       fontSize: 12, color: Theme.of(context).cardColor),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                   color: Theme.of(context).cardColor,
//                   boxShadow: [customBoxShadow()],
//                 ),
//                 child: Padding(
//                   padding:
//                   const EdgeInsets.symmetric(vertical: 15),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       PiechartWidget(
//                         color: Theme.of(context).splashColor,
//                         title: 'annual'.tr,
//                         number: '15',
//                       ),
//                       PiechartWidget(
//                         color: Theme.of(context).canvasColor,
//                         title: 'sick'.tr,
//                         number: '15',
//                       ),
//                       PiechartWidget(
//                         color: Theme.of(context).hoverColor,
//                         title: 'maternity'.tr,
//                         number: '15',
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               30.h,
//               CustomButton(
//                   height: 50,
//                   fontSize: 16,
//                   color: true,
//                   radius: 50,
//                   title: 'apply_for_leave'.tr,
//                   onPressed: () {
//                     Get.to(const LeaveFormScreen());
//                   }),
//               30.h,
//               GestureDetector(
//                 onTap: (){
//                   Get.to(RequestedLeavesScreen());
//                 },
//                 child: Container(
//                   height: 55,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Theme.of(context).colorScheme.surface,
//                     border: Border.all(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.symmetric(horizontal: 14),
//                   child: Text(
//                     'view_requested_leaves'.tr,
//                     style: interMedium.copyWith(
//                       fontSize: 14,
//                       color: Theme.of(context).disabledColor,
//                     ),
//                   ),
//                 ),
//               ),
//               50.h,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PiechartWidget extends StatelessWidget {
//   final Color color;
//   final String title;
//   final String number;
//
//   const PiechartWidget({
//     super.key,
//     required this.color,
//     required this.title,
//     required this.number,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
//       height: 40,
//       decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             '${'$title'.tr} : ',
//             style: interRegular.copyWith(
//               fontSize: 14,
//               color: Theme.of(context).disabledColor,
//             ),
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Text(
//             '$number'.tr,
//             style: interRegular.copyWith(
//               fontSize: 14,
//               color: Theme.of(context).disabledColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/base/custom_dropdown.dart';
import 'package:erp_school/view/screens/leaves/leave_form_screen.dart';
import 'package:erp_school/view/screens/leaves/request_leaves.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:get/get.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
class LeavesScreen extends StatefulWidget {
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  List<DropdownItem<int>> dmTypeList = [];
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'leaves'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h,
              // Container(
              //   height: Get.height / 2,
              //   width: Get.width,
              //   padding: EdgeInsets.symmetric(horizontal: 12),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     color: Theme.of(context).cardColor,
              //     boxShadow: [customBoxShadow()],
              //
              //   ),
              //   child:CalendarCarousel<Event>(
              //
              //     onDayPressed: (DateTime date, List<Event> events) {
              //       // Handle date selection
              //       print("Selected Date: $date");
              //     },
              //     weekendTextStyle: interSemiBold.copyWith(
              //         color: Theme.of(context).disabledColor,
              //         fontSize: 12
              //     ),
              //     weekdayTextStyle: interSemiBold.copyWith(
              //         fontSize: 11,
              //         color: Theme.of(context).disabledColor
              //     ),
              //     selectedDayBorderColor: Colors.blue,
              //     selectedDayButtonColor: Colors.blue,
              //     todayBorderColor: Colors.black,
              //     todayButtonColor: Colors.black,
              //     daysHaveCircularBorder: true,
              //     showOnlyCurrentMonthDate: true,
              //     headerTextStyle: TextStyle(
              //       fontSize: 20,
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     iconColor: Colors.black,
              //     headerMargin: EdgeInsets.symmetric(vertical: 10),
              //   ),
              // ),
              //
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       //border: Border.all(color: Colors.black, width: 1), // Outer border
              //     ),
              //     child: TableCalendar(
              //       firstDay: DateTime.utc(2020, 1, 1),
              //       lastDay: DateTime.utc(2030, 12, 31),
              //       focusedDay: _focusedDay,
              //       calendarFormat: CalendarFormat.month,
              //       selectedDayPredicate: (day) {
              //         return isSameDay(_selectedDay, day);
              //       },
              //       onDaySelected: (selectedDay, focusedDay) {
              //         setState(() {
              //           _selectedDay = selectedDay;
              //           _focusedDay = focusedDay;
              //         });
              //       },
              //
              //       calendarStyle: CalendarStyle(
              //         tableBorder: TableBorder.all(color: Colors.grey, width: 1), // Grid lines
              //         selectedDecoration: BoxDecoration(
              //           color: Colors.blue,
              //           shape: BoxShape.rectangle,
              //           borderRadius: BorderRadius.circular(2),
              //         ),
              //         todayDecoration: BoxDecoration(
              //           color: Colors.blueAccent.withOpacity(0.5),
              //           shape: BoxShape.rectangle,
              //           borderRadius: BorderRadius.circular(5),
              //         ),
              //         outsideDaysVisible: false,
              //       ),
              //       headerStyle: HeaderStyle(
              //         formatButtonVisible: false,
              //         titleCentered: true,
              //         titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //         leftChevronIcon: Icon(Icons.chevron_left),
              //         rightChevronIcon: Icon(Icons.chevron_right),
              //       ),
              //     ),
              //   ),
              // ),

              Stack(
                children: [
                  // Calendar Container
                  Container(
                    height: Get.height / 2,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CalendarCarousel<Event>(
                      onDayPressed: (DateTime date, List<Event> events) {
                        print("Selected Date: $date");
                      },
                      weekendTextStyle: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: 12,
                      ),
                      weekdayTextStyle: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).disabledColor,
                      ),
                      selectedDayBorderColor: Colors.blue,
                      selectedDayButtonColor: Colors.blue,
                      todayBorderColor: Colors.black,
                      todayButtonColor: Theme.of(context).primaryColor,
                      daysHaveCircularBorder: true,
                      showOnlyCurrentMonthDate: true,
                      headerTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      iconColor: Colors.blue,
                      headerMargin: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),

                  // Grid Lines Overlay
                  // Positioned.fill(
                  //   child: CustomPaint(
                  //     painter: GridPainter(), // Custom grid lines
                  //   ),
                  // ),
                ],
              ),
              30.h,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                height: 40,
                width: Get.width / 1.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [customBoxShadow()]),
                child: Text(
                  'my_leaves_record'.tr,
                  style: interMedium.copyWith(
                      fontSize: 12, color: Theme.of(context).cardColor),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Theme.of(context).cardColor,
                  boxShadow: [customBoxShadow()],
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PiechartWidget(
                        // color: Theme.of(context).splashColor,
                        color: Color(0xff6BFEBC),
                        title: 'annual'.tr,
                        number: '15',
                      ),
                      PiechartWidget(
                        color: Theme.of(context).colorScheme.primary,
                        title: 'sick'.tr,
                        number: '15',
                      ),
                      PiechartWidget(
                        color: Color(0xffFFD68F),
                        title: 'maternity'.tr,
                        number: '15',
                      ),
                    ],
                  ),
                ),
              ),
              30.h,
              CustomButton(
                  height: 50,
                  fontSize: 16,
                  color: true,
                  radius: 50,
                  title: 'apply_for_leave'.tr,
                  onPressed: () {
                    Get.to(const LeaveFormScreen());
                  }),
              30.h,
              GestureDetector(
                onTap: (){
                  Get.to(RequestedLeavesScreen());
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    'view_requested_leaves'.tr,
                    style: interMedium.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ),
              ),
              50.h,
            ],
          ),
        ),
      ),
    );
  }
}

class PiechartWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String number;

  const PiechartWidget({
    super.key,
    required this.color,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
      height: 40,
     // width: double.infinity,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${'$title'.tr} : ',
            style: interRegular.copyWith(
              fontSize: 12,
              color: Theme.of(context).disabledColor,
              fontWeight: FontWeight.w600
            ),
          ),

          Text(
            '$number'.tr,
            style: interRegular.copyWith(
              fontSize: 13,
              color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
// // Custom Painter to Draw Grid Lines
// class GridPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.grey.withOpacity(0.5) // Line color
//       ..strokeWidth = 1;
//
//     double rowHeight = size.height / 5.5; // 7 rows (header + 6 weeks)
//     double colWidth = size.width / 7; // 7 columns (days)
//
//     // Draw Horizontal Lines
//     for (double i = rowHeight; i < size.height; i += rowHeight) {
//       canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
//     }
//     // Draw Vertical Lines
//     for (double i = colWidth; i < size.width; i += colWidth) {
//       canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
// //


// class GridPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.grey.withOpacity(0.5) // Border color
//       ..strokeWidth = 1
//       ..style = PaintingStyle.stroke;
//
//     double headerHeight = size.height / 7; // Header row (Mo, Tu, We, etc.)
//     double rowHeight = (size.height - headerHeight) / 6; // 6 weeks
//     double colWidth = size.width / 7; // 7 columns (days)
//
//     // Draw Grid Boxes (without bottom border in last row, without right border for first column)
//     for (double row = headerHeight; row <= size.height - rowHeight; row += rowHeight) {
//       for (double col = 0; col <= size.width; col += colWidth) {
//         Rect rect = Rect.fromLTWH(col, row, colWidth, rowHeight);
//
//         // Agar row last hai toh bottom line skip karein
//         bool isLastRow = row + rowHeight >= size.height;
//
//         // Agar column first hai (1, 8, 15, 22, ...) toh right line skip karein
//         bool isFirstColumn = col == 0;
//
//         // Top border
//         canvas.drawLine(Offset(rect.left, rect.top), Offset(rect.right, rect.top), paint);
//
//         // Left border
//         canvas.drawLine(Offset(rect.left, rect.top), Offset(rect.left, rect.bottom), paint);
//         //ridht
//         canvas.drawLine(Offset(rect.right, rect.top), Offset(rect.right, rect.bottom), paint);
//         // Right border (except first column)
//         // if (!isFirstColumn) {
//         //   canvas.drawLine(Offset(rect.right, rect.top), Offset(rect.right, rect.bottom), paint);
//         // }
//
//         // Bottom border (except last row)
//         if (!isLastRow) {
//           canvas.drawLine(Offset(rect.left, rect.bottom), Offset(rect.right, rect.bottom), paint);
//         }
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
