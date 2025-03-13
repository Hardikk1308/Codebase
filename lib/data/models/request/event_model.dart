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
      eventName: json['eventName'] as String,
      eventDate: json['eventDate'] as String,
      eventTime: json['eventTime'] as String,
      eventDescription: json['eventDescription'] as String,
      upcomingFlag: json['upcomingFlag'] as bool,
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