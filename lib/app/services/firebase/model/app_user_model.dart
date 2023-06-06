import 'dart:convert';


class AppUser {
  final String email;
  final String name;
  final String? stream;
  final String? branch;
  final int? semester;
  final UserSocialUrl? socialUrl;
  AppUser({
    required this.email,
    required this.name,
    this.stream,
    this.branch,
    this.semester,
    this.socialUrl,
  });

  AppUser copyWith({
    String? email,
    String? name,
    String? stream,
    String? branch,
    int? semester,
    UserSocialUrl? socialUrl,
  }) {
    return AppUser(
      email: email ?? this.email,
      name: name ?? this.name,
      stream: stream ?? this.stream,
      branch: branch ?? this.branch,
      semester: semester ?? this.semester,
      socialUrl: socialUrl ?? this.socialUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'stream': stream,
      'branch': branch,
      'semester': semester,
      'socialUrl': socialUrl?.toMap(),
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      email: map['email'] as String,
      name: map['name'] as String,
      stream: map['stream'] != null ? map['stream'] as String : null,
      branch: map['branch'] != null ? map['branch'] as String : null,
      semester: map['semester'] != null ? map['semester'] as int : null,
      socialUrl: map['socialUrl'] != null ? UserSocialUrl.fromMap(map['socialUrl'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(email: $email, name: $name, stream: $stream, branch: $branch, semester: $semester, socialUrl: $socialUrl)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.name == name &&
      other.stream == stream &&
      other.branch == branch &&
      other.semester == semester &&
      other.socialUrl == socialUrl;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      name.hashCode ^
      stream.hashCode ^
      branch.hashCode ^
      semester.hashCode ^
      socialUrl.hashCode;
  }
}

class UserSocialUrl {
  final String? github;
  final String? linkedin;
  final String? twitter;
  final String? instagram;
  final String? facebook;
  UserSocialUrl({
    this.github,
    this.linkedin,
    this.twitter,
    this.instagram,
    this.facebook,
  });

  UserSocialUrl copyWith({
    String? github,
    String? linkedin,
    String? twitter,
    String? instagram,
    String? facebook,
  }) {
    return UserSocialUrl(
      github: github ?? this.github,
      linkedin: linkedin ?? this.linkedin,
      twitter: twitter ?? this.twitter,
      instagram: instagram ?? this.instagram,
      facebook: facebook ?? this.facebook,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'github': github,
      'linkedin': linkedin,
      'twitter': twitter,
      'instagram': instagram,
      'facebook': facebook,
    };
  }

  factory UserSocialUrl.fromMap(Map<String, dynamic> map) {
    return UserSocialUrl(
      github: map['github'] != null ? map['github'] as String : null,
      linkedin: map['linkedin'] != null ? map['linkedin'] as String : null,
      twitter: map['twitter'] != null ? map['twitter'] as String : null,
      instagram: map['instagram'] != null ? map['instagram'] as String : null,
      facebook: map['facebook'] != null ? map['facebook'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSocialUrl.fromJson(String source) => UserSocialUrl.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserSocialUrl(github: $github, linkedin: $linkedin, twitter: $twitter, instagram: $instagram, facebook: $facebook)';
  }

  @override
  bool operator ==(covariant UserSocialUrl other) {
    if (identical(this, other)) return true;
  
    return 
      other.github == github &&
      other.linkedin == linkedin &&
      other.twitter == twitter &&
      other.instagram == instagram &&
      other.facebook == facebook;
  }

  @override
  int get hashCode {
    return github.hashCode ^
      linkedin.hashCode ^
      twitter.hashCode ^
      instagram.hashCode ^
      facebook.hashCode;
  }
}
