import 'dart:convert';

import '../../sheet/model/resources_entities.dart';

class DateWrapper {
  final DateTime date;
  final IndexFile file;
  const DateWrapper({required this.date, required this.file});

  DateWrapper copyWith({DateTime? date, IndexFile? file}) =>
      DateWrapper(date: date ?? this.date, file: file ?? this.file);

  Map<String, dynamic> toMap() => <String, dynamic>{
        'date': date.millisecondsSinceEpoch,
        'file': file.toMap()
      };

  factory DateWrapper.fromMap(Map<String, dynamic> map) => DateWrapper(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      file: IndexFile.fromMap(map['file'] as Map<String, dynamic>));

  String toJson() => json.encode(toMap());

  factory DateWrapper.fromJson(String source) =>
      DateWrapper.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DateWrapper(date: $date, file: $file)';

  @override
  bool operator ==(covariant DateWrapper other) => (identical(this, other))
      ? true
      : other.date == date && other.file == file;

  @override
  int get hashCode => date.hashCode ^ file.hashCode;
}
