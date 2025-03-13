import 'dart:convert';

import 'package:erp_school/data/models/response/student_event_calender_year_model.dart';
import 'package:erp_school/services/school_event_calendar_service.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentYearModelNew extends StatefulWidget {
  const StudentYearModelNew({super.key});

  @override
  State<StudentYearModelNew> createState() => _StudentYearModelNewState();
}

class _StudentYearModelNewState extends State<StudentYearModelNew> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late Future<StudentYearModel> _eventDataFuture;
  final SchoolEventCalendarService _eventService = SchoolEventCalendarService();
  late Map<String, List<Event>> _events;
  late Map<DateTime, List<Event>> _eventsByDate;
  late List<Event> _monthlyEvents;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now(); // Initialize with the current date
    _selectedDay = DateTime.now(); // Initialize with the current date
    _eventDataFuture = _eventService.fetchEventData().then((dataModel) {
      // Clamp _focusedDay to the range of firstDay and lastDay
      final firstDay = DateTime(dataModel.eventYear, 1, 1);
      final lastDay = DateTime(dataModel.eventYear, 12, 31);
      if (_focusedDay.isBefore(firstDay)) {
        _focusedDay = firstDay;
      } else if (_focusedDay.isAfter(lastDay)) {
        _focusedDay = lastDay;
      }
      return dataModel;
    });
    _events = {};
    _eventsByDate = {};
    _monthlyEvents = [];
  }

  // Group events by date
  void _groupEventsByDate(StudentYearModel dataModel) {
    _events = {};
    for (var eventMonth in dataModel.eventsList) {
      for (var event in eventMonth.events) {
        final date = event.eventDate; // Ensure this is in "yyyy-MM-dd" format
        if (_events[date] == null) {
          _events[date] = [];
        }
        _events[date]!.add(event);
      }
    }
    _eventsByDate = _events.map((key, value) {
      final date = DateTime.parse(key); // Parse the date string to DateTime
      return MapEntry(date, value);
    });
  }

  // Get events for the selected day
  List<Event> _getEventsForDay(DateTime day) {
    return _eventsByDate[day] ?? [];
  }

  // Get events for the selected month
  void _updateMonthlyEvents(DateTime month) {
    _monthlyEvents = _eventsByDate.entries
        .where((entry) =>
            entry.key.year == month.year && entry.key.month == month.month)
        .expand((entry) => entry.value)
        .toList();
  }

  // Determine the color for the event marker
  String coloreTheEvent(var date) {
    for (var element in _monthlyEvents) {
      if (date.toString().contains(element.eventDate)) {
        return element.upcomingFlag ? 'red' : 'green';
      }
    }
    return 'white';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
        title: 'event_calender'.tr,
      ),
      body: FutureBuilder<StudentYearModel>(
        future: _eventDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            final dataModel = snapshot.data!;
            _groupEventsByDate(dataModel);
            _updateMonthlyEvents(_focusedDay);

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Calendar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Card(
                      elevation: 4, // Card shadow
                      color: Colors.white,
                      child: TableCalendar(
                        firstDay: DateTime(dataModel.eventYear, 1, 1),
                        lastDay: DateTime(dataModel.eventYear, 12, 31),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) =>
                            isSameDay(_selectedDay, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        onPageChanged: (focusedDay) {
                          setState(() {
                            _focusedDay = focusedDay;
                            _updateMonthlyEvents(focusedDay);
                          });
                        },
                        eventLoader: _getEventsForDay,
                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          selectedTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          defaultTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          weekendTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          holidayTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: Colors.blue.shade900,
                          ),
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, date, events) {
                            var colorRequired = coloreTheEvent(date);
                            return Container(
                              width: 30,
                              height: 10,
                              decoration: BoxDecoration(
                                color: colorRequired == 'red'
                                    ? Colors.red
                                    : colorRequired == 'green'
                                        ? Colors.blue.shade900
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Event List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _monthlyEvents.length,
                    itemBuilder: (context, index) {
                      final event = _monthlyEvents[index];
                      print("MyEventName::${event.eventName}");
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                              child: Text(
                                utf8.decode(event.eventName.runes.toList()),
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          utf8.decode(event
                                              .eventDescription.runes
                                              .toList()),
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Time: ${event.eventTime}',
                                              style: TextStyle(
                                                color: Colors.blue.shade900,
                                              ),
                                            ),
                                            Text(
                                              '${event.eventDate}  ',
                                              style: TextStyle(
                                                color: Colors.blue.shade900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  event.upcomingFlag
                                      ? Icon(
                                          Icons.notifications_active,
                                          color: Colors.blue.shade900,
                                        )
                                      : Icon(Icons.notifications_off,
                                          color: Colors.blue.shade900),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
