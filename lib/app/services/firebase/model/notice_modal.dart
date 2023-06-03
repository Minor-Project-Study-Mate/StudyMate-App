import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Event {
  String title;
  String description;
  String date;
  String time;
  String? url;
  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.url,
  });

  String? get id => null;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'url': url,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);
}
