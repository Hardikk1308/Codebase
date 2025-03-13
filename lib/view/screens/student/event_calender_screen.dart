import 'package:erp_school/data/models/response/event_response.dart';
import 'package:erp_school/services/school_event_calendar_service.dart';
import 'package:erp_school/themes/light.dart';
import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/screens/student/add_event.dart';
import 'package:erp_school/view/screens/student/widget/event_calender_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsCalendarScreen extends StatefulWidget {
  final bool eventCalender;
  const EventsCalendarScreen({super.key, this.eventCalender = false});

  @override
  _EventsCalendarScreenState createState() => _EventsCalendarScreenState();
}

class _EventsCalendarScreenState extends State<EventsCalendarScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay =
      DateTime(2024, 10, 10); // Set the focused day to May 2024
  DateTime? _selectedDay;

  final Map<DateTime, List<Event>> _events = {
    DateTime(2024, 5, 11): [Event('Art Competition')],
    DateTime(2024, 5, 18): [
      Event('Environmental Awareness Drive'),
      Event('Parent-Teacher Meeting'),
    ],
  };

  late Future<EventResponse> eventResponse;
  final SchoolEventCalendarService _schoolEventCalendarService = SchoolEventCalendarService();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    eventResponse = _schoolEventCalendarService.fetchSchoolEventCalender();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      floatingActionButton: widget.eventCalender
          ? FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Get.to(const AddEventScreen());
        },
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor),
          child: Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).cardColor,
            ),
          ),
        ),
      )
          : null,
      appBar: CustomAppBar(
        title: 'event_calender'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [customBoxShadow()],
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                height: 400, // Set a fixed height for the calendar
                child: TableCalendar<Event>(
                  firstDay: DateTime.utc(2022, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  calendarFormat: _calendarFormat,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                    _selectedEvents.value = _getEventsForDay(selectedDay);
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  eventLoader: (day) {
                    if ((day.day == 17) ||
                        (day.day == 18) ||
                        (day.day == 1) ||
                        (day.day == 2) ||
                        (day.day == 3) ||
                        (day.day == 4) ||
                        (day.day == 14) ||
                        (day.day == 12) ||
                        (day.day == 15)) {
                      return [Event('Event on ${day.day}')];
                    }
                    return [];
                  },
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: interSemiBold.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).disabledColor,
                    ),
                    leftChevronIcon: Icon(Icons.keyboard_arrow_left,
                        color: Theme.of(context).disabledColor),
                    rightChevronIcon: Icon(Icons.keyboard_arrow_right_sharp,
                        color: Theme.of(context).disabledColor),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: interSemiBold.copyWith(
                      color: Theme.of(context).disabledColor,
                      fontSize: 10,
                    ),
                    weekendStyle: interSemiBold.copyWith(
                      color: Theme.of(context).disabledColor,
                      fontSize: 10,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    todayTextStyle: interSemiBold.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).disabledColor,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.rectangle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.rectangle,
                    ),
                    defaultTextStyle: interMedium.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor,
                    ),
                    markerDecoration: BoxDecoration(
                      color: Theme.of(context).indicatorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('upcoming_school_event'.tr,
                  style: interMedium.copyWith(
                      fontSize: 18, color: Theme.of(context).disabledColor)),
            ),
            const SizedBox(height: 20),

            FutureBuilder<EventResponse>(
              future: eventResponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!.events
                        .map((event) => EventCalenderWidget(
                              event: event,
                            ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),

            FutureBuilder<EventResponse>(
              future: eventResponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!.events
                        .map((event) => EventCalenderWidget(
                              event: event,
                            ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),

            // EventCalenderWidget(),
            // EventCalenderWidget(),
            // EventCalenderWidget(),
            // EventCalenderWidget(),
          ],
        ),
      ),
    );
  }
}

class Event {
  final String title;

  Event(this.title);

  @override
  String toString() => title;
}
