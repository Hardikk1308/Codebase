import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/dimensions.dart';
import 'package:erp_school/utils/images.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    final EventList<Event> markedDatesMap = EventList<Event>(
      events: {
        DateTime(2024, 12, 4): [
          Event(
            date: DateTime(2024, 12, 4),
            title: 'Red Event',
            icon: _buildEventIcon(Colors.green, "4"),
          ),
        ],
        DateTime(2024, 12, 5): [
          Event(
            date: DateTime(2024, 12, 5),
            title: 'Red Event',
            icon: _buildEventIcon(Colors.green, "5"),
          ),
        ],
        DateTime(2024, 12, 6): [
          Event(
            date: DateTime(2024, 12, 6),
            title: 'Red Event',
            icon: _buildEventIcon(Colors.green, "6"),
          ),
        ],
        DateTime(2024, 12, 13): [
          Event(
            date: DateTime(2024, 12, 13),
            title: 'Blue Event',
            icon: _buildEventIcon(Colors.yellow, "13"),
          ),
        ],
        DateTime(2024, 12, 12): [
          Event(
            date: DateTime(2024, 12, 12),
            title: 'Yellow Event',
            icon: _buildEventIcon(Colors.yellow, "12"),
          ),
        ],
        DateTime(2024, 12, 10): [
          Event(
            date: DateTime(2024, 12, 18),
            title: 'Purple Event',
            icon: _buildEventIcon(Colors.red, "10"),
          ),
        ],
        DateTime(2024, 12, 28): [
          Event(
            date: DateTime(2024, 12, 28),
            title: 'Purple Event',
            icon: _buildEventIcon(Colors.grey, "28"),
          ),
        ],
        DateTime(2024, 12, 29): [
          Event(
            date: DateTime(2024, 12, 29),
            title: 'Purple Event',
            icon: _buildEventIcon(Colors.grey, "29"),
          ),
        ],
      },
    );

    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'attendance'.tr,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 55,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).cardColor,
                    boxShadow: [customBoxShadow()]),
                child: Row(
                  children: [
                    Image.asset(
                      Images.classPng,
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Class VII , Section B',
                      style: interMedium.copyWith(
                          color: Theme.of(context).disabledColor, fontSize: 16),
                    )
                  ],
                ),
              ),
              20.h,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 40,
                width: Get.width / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [customBoxShadow()]),
                child: Center(
                  child: Text(
                    'monthly_record_dashboard'.tr,
                    style: interMedium.copyWith(
                        fontSize: 12, color: Theme.of(context).cardColor),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PiechartWidget(
                            color: Theme.of(context).splashColor,
                            title: 'Present',
                            number: '15',
                          ),
                          PiechartWidget(
                            color: Theme.of(context).canvasColor,
                            title: 'Absent',
                            number: '15',
                          ),
                          PiechartWidget(
                            color: Theme.of(context).hoverColor,
                            title: 'Holiday',
                            number: '15',
                          ),
                          PiechartWidget(
                            color: Theme.of(context).hintColor,
                            title: 'Weekend',
                            number: '',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200, // Set fixed height
                        width: 180, // Set fixed width
                        child: PieChart(
                          PieChartData(
                            sections: _buildPieChartSections(),
                            centerSpaceRadius: 0, // No inner circle
                            sectionsSpace: 0, // Remove space between sections
                            borderData:
                                FlBorderData(show: false), // Hides border
                            startDegreeOffset:
                                -90, // Start position for alignment
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              30.h,
              Container(
                height: Get.height / 2,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).cardColor,
                  boxShadow: [customBoxShadow()],
                ),
                // child:CalendarCarousel(
                //   todayTextStyle: TextStyle(
                //     color: Theme.of(context).primaryColor,
                //     background: Paint(),
                //   ),
                //   onDayPressed: (DateTime date, List<Event> events) {
                //     // Handle date selection
                //     print("Selected Date: $date");
                //   },
                //   weekendTextStyle: interSemiBold.copyWith(
                //       color: Theme.of(context).disabledColor,
                //       fontSize: 12
                //   ),
                //   weekdayTextStyle: interSemiBold.copyWith(
                //     fontSize: 11,
                //     color: Theme.of(context).disabledColor,
                //   ),
                //   selectedDayBorderColor: Colors.blue,
                //   selectedDayButtonColor: Colors.blueAccent,
                //   todayBorderColor: Colors.black,
                //   todayButtonColor: Colors.black,
                //   daysHaveCircularBorder: true,
                //   showOnlyCurrentMonthDate: true,
                //   headerTextStyle: TextStyle(
                //     fontSize: 20,
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   iconColor: Colors.blue,
                //   headerMargin: EdgeInsets.symmetric(vertical: 10),
                // ),
                child: CalendarCarousel<Event>(
                  todayTextStyle: TextStyle(
                    color: Colors.white,
                    // background: Paint(),
                  ),
                  onDayPressed: (DateTime date, List<Event> events) {
                    // Handle date selection
                    print("Selected Date: $date");
                  },
                  weekendTextStyle: interSemiBold.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 12,
                  ),
                  weekdayTextStyle: interSemiBold.copyWith(
                    fontSize: 11,
                    color: Theme.of(context).disabledColor,
                  ),
                  selectedDayBorderColor: Colors.blue,
                  selectedDayButtonColor: Colors.blueAccent,
                  todayBorderColor: Get.theme.primaryColor,
                  todayButtonColor: Get.theme.primaryColor,
                  daysHaveCircularBorder:
                      false, // Disable circular border for rectangle shape
                  showOnlyCurrentMonthDate: true,
                  headerTextStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  iconColor: Colors.blue,
                  headerMargin: EdgeInsets.symmetric(vertical: 10),
                  // markedDateCustomShapeBorder: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(5), // Rectangle shape
                  // ),
                  markedDateCustomTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  markedDateShowIcon: true,
                  markedDateIconBuilder: (event) => event.icon,
                  markedDatesMap: markedDatesMap,
                  // markedDatesMap: EventList<Event>(events: {
                  //   for (var event in markedDates) event.date: [event],
                  // }),
                  // markedDateIconBuilder: (event) {
                  //   return event.title == 'Green'
                  //       ? Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.green,
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //   )
                  //       : Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.red,
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //   );
                  // },
                ),
              ),
              30.h,
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    return [
      PieChartSectionData(
        value: 60,
        color: Get.theme.splashColor,
        title: '', // Remove label
        radius: 50, // Radius for this section
      ),
      PieChartSectionData(
        value: 25,
        color: Get.theme.canvasColor,
        title: '', // Remove label
        radius: 50,
      ),
      PieChartSectionData(
        value: 15,
        color: Get.theme.hoverColor,
        title: '', // Remove label
        radius: 50,
      ),
      PieChartSectionData(
        value: 25,
        color: Get.theme.hintColor,
        title: '', // Remove label
        radius: 50,
      ),
    ];
  }

  static Widget _buildEventIcon(Color color, String date) {
    return Container(
      width: Get.width,
      height: Get.width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
      ),
      child: Center(
          child: Text(
        date,
        style: interSemiBold.copyWith(fontSize: 14, color: Colors.black),
      )),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '$title'.tr,
            style: interMedium.copyWith(
              fontSize: 14,
              color: Theme.of(context).disabledColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '$number'.tr,
            style: interMedium.copyWith(
              fontSize: 14,
              color: Theme.of(context).disabledColor,
            ),
          ),
        ],
      ),
    );
  }
}
