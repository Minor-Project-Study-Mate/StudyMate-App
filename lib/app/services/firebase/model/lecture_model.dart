import 'dart:convert';
import 'package:flutter/foundation.dart';

class Subject {
  final String name;
  final String? description;
  final List<Playlist> playlists;
  const Subject({
    required this.name,
    this.description,
    required this.playlists,
  });

  Subject copyWith({
    String? name,
    String? description,
    List<Playlist>? playlists,
  }) {
    return Subject(
      name: name ?? this.name,
      description: description ?? this.description,
      playlists: playlists ?? this.playlists,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'playlists': playlists.map((x) => x.toMap()).toList(),
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      name: map['name'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      playlists: List<Playlist>.from((map['playlists']).map<Playlist>((x) => Playlist.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) => Subject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Subject(name: $name, description: $description, playlists: $playlists)';

  @override
  bool operator ==(covariant Subject other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      listEquals(other.playlists, playlists);
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ playlists.hashCode;
}

class Playlist {
  final String title;
  final String? description;
  final String url;
  final String? thumbnailUrl;
  const Playlist({
    required this.title,
    this.description,
    required this.url,
    this.thumbnailUrl,
  });

  Playlist copyWith({
    String? title,
    String? description,
    String? url,
    String? thumbnailUrl,
  }) {
    return Playlist(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Playlist.fromMap(Map<String, dynamic> map) {
    return Playlist(
      title: map['title'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] != null ? map['thumbnailUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Playlist.fromJson(String source) => Playlist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Playlist(title: $title, description: $description, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(covariant Playlist other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.url == url &&
      other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode;
  }
}
