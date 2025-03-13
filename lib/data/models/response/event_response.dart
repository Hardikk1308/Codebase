import 'package:erp_school/data/models/request/event_model.dart';

class EventResponse {
  final String eventMonth;
  final int eventYear;
  final List<Event> events;

  EventResponse({
    required this.eventMonth,
    required this.eventYear,
    required this.events,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      eventMonth: json['eventMonth'] as String,
      eventYear: json['eventYear'] as int,
      events: (json['events'] as List)
          .map((event) => Event.fromJson(event as Map<String, dynamic>))
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

