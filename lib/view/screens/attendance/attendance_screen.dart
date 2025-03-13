import 'package:erp_school/data/models/request/PieChartSectionModel.dart';
import 'package:erp_school/data/models/response/AttendanceSummaryModel.dart';
import 'package:erp_school/services/attendance_service.dart'; // Import the service
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
import '../../../data/models/request/EventModel.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // AttendanceSummaryModel? attendanceSummaryFuture;
  Future<AttendanceSummaryModel?>? attendanceSummaryFuture;
  final AttendanceService _attendanceService = AttendanceService();
  late Map<DateTime, List<Event>> _eventsByDate;
  DateTime _currentMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Fetch data using the service layer
    _eventsByDate = {};
    _fetchAttendanceSummary();
  }

  void _fetchAttendanceSummary() {
    setState(() {
      attendanceSummaryFuture = _attendanceService.fetchAttendanceSummary(
        year: _currentMonth.year,
        month: _currentMonth.month,
      );
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _eventsByDate[day] ?? [];
  }

  _beforeDisplayingDate(DateTime date) {
    print('Displaying events for date: $date');
    final events = _getEventsForDay(date);
    print('Events: $events');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'attendance'.tr,
      ),
      body: FutureBuilder<AttendanceSummaryModel?>(
        future: attendanceSummaryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            // Populate pie chart sections
            final pieChartSections = [
              PieChartSectionModel(
                value: 0.0,
                color: Colors.green,
                title: 'Present',
                number: "0",
              ),
              PieChartSectionModel(
                value: 0.0,
                color: Colors.red,
                title: 'Absent',
                number: "0",
              ),
              PieChartSectionModel(
                value: 0.0,
                color: Colors.yellow,
                title: 'Holiday',
                number: "0",
              ),
              PieChartSectionModel(
                value: 0.0,
                color: Colors.orange,
                title: 'Not Taken',
                number: "0",
              ),
            ];

            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.h,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
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
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    20.h,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Theme.of(context).cardColor,
                        boxShadow: [customBoxShadow()],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: pieChartSections.map((section) {
                                return PiechartWidget(
                                  color: section.color,
                                  title: section.title,
                                  number: section.number,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    30.h,
                    Container(
                      height: Get.height / 2,
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).cardColor,
                        boxShadow: [customBoxShadow()],
                      ),
                      child: CalendarCarousel<Event>(
                        todayTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        onDayPressed: (DateTime date, List<Event> events) {
                          _beforeDisplayingDate(
                              date); // Call method before displaying date
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
                        targetDateTime: _currentMonth,
                        selectedDayBorderColor: Colors.transparent,
                        selectedDayButtonColor: Colors.transparent,
                        todayBorderColor: Get.theme.primaryColor,
                        todayButtonColor: Get.theme.primaryColor,
                        daysHaveCircularBorder: false,
                        showOnlyCurrentMonthDate: true,
                        headerTextStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        iconColor: Colors.blue,
                        headerMargin: const EdgeInsets.symmetric(vertical: 10),
                        markedDateCustomTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        markedDateShowIcon: true,
                        markedDateIconBuilder: (event) {
                          _beforeDisplayingDate(
                              event.date); // Call method before displaying date
                          return event.icon;
                        },
                        onCalendarChanged: (DateTime newMonth) {
                          setState(() {
                            _currentMonth = newMonth;
                          });
                          _fetchAttendanceSummary(); // Fetch data for the new month
                        },
                        // markedDatesMap: markedDatesMap,
                      ),
                    ),
                    30.h,
                  ],
                ),
              ),
            );
          } else {
            final attendanceSummary = snapshot.data!;

            // Populate pie chart sections
            final pieChartSections = [
              PieChartSectionModel(
                value: attendanceSummary.attendance.presentDays.toDouble(),
                color: Colors.green,
                title: 'Present',
                number: attendanceSummary.attendance.presentDays.toString(),
              ),
              PieChartSectionModel(
                value: attendanceSummary.attendance.absentDays.toDouble(),
                color: Colors.red,
                title: 'Absent',
                number: attendanceSummary.attendance.absentDays.toString(),
              ),
              PieChartSectionModel(
                value: attendanceSummary.attendance.holidayDays.toDouble(),
                color: Colors.yellow,
                title: 'Holiday',
                number: attendanceSummary.attendance.holidayDays.toString(),
              ),
              PieChartSectionModel(
                value: attendanceSummary.attendance.attendanceNotTakenDays
                    .toDouble(),
                color: Colors.orange,
                title: 'Not Taken',
                number: attendanceSummary.attendance.attendanceNotTakenDays
                    .toString(),
              ),
            ];

            // Populate marked dates
            final markedDates = <EventModel>[];
            for (var date in attendanceSummary.attendance.dateLists.present) {
              markedDates.add(EventModel(
                date: DateTime(
                    int.parse(date.split('-')[0]),
                    int.parse(date.split('-')[1]),
                    int.parse(date.split('-')[2])),
                title: 'Present',
                color: Colors.green,
                dateNumber: date.split('-').last,
              ));
            }
            for (var date in attendanceSummary.attendance.dateLists.absent) {
              markedDates.add(EventModel(
                date: DateTime(
                    int.parse(date.split('-')[0]),
                    int.parse(date.split('-')[1]),
                    int.parse(date.split('-')[2])),
                title: 'Absent',
                color: Colors.red,
                dateNumber: date.split('-').last,
              ));
            }
            for (var date in attendanceSummary.attendance.dateLists.holiday) {
              markedDates.add(EventModel(
                date: DateTime(
                    int.parse(date.split('-')[0]),
                    int.parse(date.split('-')[1]),
                    int.parse(date.split('-')[2])),
                title: 'Holiday',
                dateNumber: date.split('-').last,
                color: Colors.yellow,
              ));
            }
            for (var date in attendanceSummary.attendance.dateLists.attendanceNotTaken) {
              markedDates.add(EventModel(
                date: DateTime(
                    int.parse(date.split('-')[0]),
                    int.parse(date.split('-')[1]),
                    int.parse(date.split('-')[2])),
                title: 'Not Taken',
                dateNumber: date.split('-').last,
                color: Colors.orange,
              ));
            }
            final markedDatesMap =
                EventList<Event>(events: {}); // Initialize with an empty map

            for (var event in markedDates) {
              final normalizedDate = normalizeDate(event.date);
              if (markedDatesMap.events[normalizedDate] == null) {
                markedDatesMap.events[normalizedDate] = [];
              }
              markedDatesMap.events[normalizedDate]!.add(
                Event(
                  date: normalizedDate,
                  title: event.title,
                  icon: _buildEventIcon(event.color, event.dateNumber),
                ),
              );
            }

            // Debugging: Print marked dates
            markedDatesMap.events.forEach((date, events) {
              print('Date: $date, Events: ${events.length}');
            });

            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.h,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
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
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${attendanceSummary.name} - ${attendanceSummary.rollNumber}',
                            style: interMedium.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    20.h,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Theme.of(context).cardColor,
                        boxShadow: [customBoxShadow()],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: pieChartSections.map((section) {
                                return PiechartWidget(
                                  color: section.color,
                                  title: section.title,
                                  number: section.number,
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 200, // Set fixed height
                              width: 155, // Set fixed width
                              child: PieChart(
                                PieChartData(
                                  sections:
                                      _buildPieChartSections(pieChartSections),
                                  centerSpaceRadius: 0, // No inner circle
                                  sectionsSpace:
                                      0, // Remove space between sections
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).cardColor,
                        boxShadow: [customBoxShadow()],
                      ),
                      child: CalendarCarousel<Event>(
                        targetDateTime: _currentMonth,
                        todayTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        onDayPressed: (DateTime date, List<Event> events) {
                          _beforeDisplayingDate(
                              date); // Call method before displaying date
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
                        selectedDayBorderColor: Colors.transparent,
                        selectedDayButtonColor: Colors.transparent,
                        todayBorderColor: Get.theme.primaryColor,
                        todayButtonColor: Get.theme.primaryColor,
                        daysHaveCircularBorder: false,
                        showOnlyCurrentMonthDate: true,
                        headerTextStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        iconColor: Colors.blue,
                        headerMargin: const EdgeInsets.symmetric(vertical: 10),
                        markedDateCustomTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        markedDateShowIcon: true,
                        markedDateIconBuilder: (event) {
                          _beforeDisplayingDate(
                              event.date); // Call method before displaying date
                          return event.icon;
                        },
                        onCalendarChanged: (DateTime newMonth) {
                          setState(() {
                            _currentMonth = newMonth;
                            _fetchAttendanceSummary();
                          });
                        },
                        markedDatesMap: markedDatesMap,
                      ),
                    ),
                    30.h,
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
      List<PieChartSectionModel> sections) {
    return sections.map((section) {
      return PieChartSectionData(
        value: section.value,
        color: section.color,
        title: '', // Remove label
        radius: 50, // Radius for this section
      );
    }).toList();
  }

  static Widget _buildEventIcon(Color color, String date) {
    print('Building icon for date $date with color $color');
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
        ),
      ),
    );
  }

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
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
          const SizedBox(
            width: 20,
          ),
          Text(
            title.tr,
            style: interMedium.copyWith(
              fontSize: 14,
              color: Theme.of(context).disabledColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            number.tr,
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
