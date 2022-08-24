import 'dart:convert';

class Provider {
  final int id;
  final String name;
  final String description;
  // final Image image;

  Provider(this.id, this.name, this.description);

  Provider.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };

  // factory Provider.fromJson(dynamic json) {
  //   return Provider(json['id'] as int, json['name'] as String,
  //       json['description'] as String);
  // }
}
