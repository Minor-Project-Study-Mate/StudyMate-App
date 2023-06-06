// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Event {
  final String title;
  final String description;
  final DateTime dateTime;
  final String? url;
  const Event({
    required this.title,
    required this.description,
    required this.dateTime,
    this.url
  });


  Event copyWith({
    String? title,
    String? description,
    DateTime? dateTime,
    String? url,
  }) {
    return Event(
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'url': url,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Event(title: $title, description: $description, dateTime: $dateTime, url: $url)';
  }

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.dateTime == dateTime &&
      other.url == url;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      dateTime.hashCode ^
      url.hashCode;
  }
}
