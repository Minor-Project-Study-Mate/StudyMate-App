// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cource {
  final String title;
  final String url;
  final String thumbnailUrl;
  Cource({
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Cource copyWith({
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return Cource(
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Cource.fromMap(Map<String, dynamic> map) {
    return Cource(
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cource.fromJson(String source) => Cource.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cource(title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';

  @override
  bool operator ==(covariant Cource other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.url == url &&
      other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode => title.hashCode ^ url.hashCode ^ thumbnailUrl.hashCode;
}
