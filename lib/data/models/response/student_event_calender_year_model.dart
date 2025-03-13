class StudentYearModel {
  final int eventYear;
  final List<EventMonth> eventsList;

  StudentYearModel({
    required this.eventYear,
    required this.eventsList,
  });

  factory StudentYearModel.fromJson(Map<String, dynamic> json) {
    return StudentYearModel(
      eventYear: int.parse(json['eventYear']),
      eventsList: (json['eventsList'] as List)
          .map((eventMonth) => EventMonth.fromJson(eventMonth))
          .toList(),
    );
  }
}

class EventMonth {
  final String eventMonth;
  final List<Event> events;

  EventMonth({
    required this.eventMonth,
    required this.events,
  });

  factory EventMonth.fromJson(Map<String, dynamic> json) {
    return EventMonth(
      eventMonth: json['eventMonth'],
      events: (json['events'] as List)
          .map((event) => Event.fromJson(event))
          .toList(),
    );
  }
}

class Event {
  final String eventName;
  final String eventDate;
  final String eventTime;
  final String eventDescription;
  final bool upcomingFlag;

  Event({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventDescription,
    required this.upcomingFlag,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventName: json['eventName'],
      eventDate: json['eventDate'],
      eventTime: json['eventTime'],
      eventDescription: json['eventDescription'] as String,
      upcomingFlag: json['upcomingFlag'] as bool,
    );
  }
}
