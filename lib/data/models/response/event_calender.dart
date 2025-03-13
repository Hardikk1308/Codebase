class EventCalendar {
  final String eventMonth;
  final int eventYear;
  final List<Event> events;

  EventCalendar({
    required this.eventMonth,
    required this.eventYear,
    required this.events,
  });

  factory EventCalendar.fromJson(Map<String, dynamic> json) {
    return EventCalendar(
      eventMonth: json['eventMonth'],
      eventYear: json['eventYear'],
      events: (json['events'] as List<dynamic>)
          .map((event) => Event.fromJson(event))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventMonth': eventMonth,
      'eventYear': eventYear,
      'events': events.map((event) => event.toJson()).toList(),
    };
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
      eventDescription: json['eventDescription'],
      upcomingFlag: json['upcomingFlag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventName': eventName,
      'eventDate': eventDate,
      'eventTime': eventTime,
      'eventDescription': eventDescription,
      'upcomingFlag': upcomingFlag,
    };
  }
}
