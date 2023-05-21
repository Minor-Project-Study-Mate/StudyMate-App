import 'dart:convert';

class IndexEntity {
  final String name;
  final String path;
  const IndexEntity({required this.name, required this.path});
}

class IndexFolder implements IndexEntity {
  @override
  final String name;
  @override
  final String path;

  const IndexFolder({required this.name, required this.path}) : super();
}

class IndexFile implements IndexEntity {
  @override
  final String name;
  @override
  final String path;
  final String id;
  final String? description;
  final double size;
  const IndexFile(
      {required this.name,
      required this.path,
      required this.id,
      this.description,
      required this.size})
      : super();

  IndexFile copyWith(
          {String? name,
          String? path,
          String? id,
          String? description,
          double? size}) =>
      IndexFile(
          name: name ?? this.name,
          path: path ?? this.path,
          id: id ?? this.id,
          description: description ?? this.description,
          size: size ?? this.size);

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'path': path,
        'id': id,
        'description': description,
        'size': size,
      };

  factory IndexFile.fromMap(Map<String, dynamic> map) => IndexFile(
        name: map['name'] as String,
        path: map['path'] as String,
        id: map['id'] as String,
        description:
            map['description'] != null ? map['description'] as String : null,
        size: map['size'] as double,
      );

  String toJson() => json.encode(toMap());

  factory IndexFile.fromJson(String source) =>
      IndexFile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IndexFile(name: $name, path: $path, id: $id, description: $description, size: $size)';

  @override
  bool operator ==(covariant IndexFile other) => (identical(this, other))
      ? true
      : other.name == name &&
          other.path == path &&
          other.id == id &&
          other.description == description &&
          other.size == size;

  @override
  int get hashCode =>
      name.hashCode ^
      path.hashCode ^
      id.hashCode ^
      description.hashCode ^
      size.hashCode;
}
