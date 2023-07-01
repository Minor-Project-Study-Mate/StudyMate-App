import 'dart:convert';

class Event {
  final String title;
  final String description;
  final DateTime dateTime;
  final String? thumbnailUrl;
  final String? url;
  Event({
    required this.title,
    required this.description,
    required this.dateTime,
    this.thumbnailUrl,
    this.url,
  });

  Event copyWith({
    String? title,
    String? description,
    DateTime? dateTime,
    String? thumbnailUrl,
    String? url,
  }) {
    return Event(
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'thumbnailUrl': thumbnailUrl,
      'url': url,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      thumbnailUrl:
          map['thumbnailUrl'] != null ? map['thumbnailUrl'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Event(title: $title, description: $description, dateTime: $dateTime, thumbnailUrl: $thumbnailUrl, url: $url)';
  }

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.dateTime == dateTime &&
        other.thumbnailUrl == thumbnailUrl &&
        other.url == url;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        dateTime.hashCode ^
        thumbnailUrl.hashCode ^
        url.hashCode;
  }
}
