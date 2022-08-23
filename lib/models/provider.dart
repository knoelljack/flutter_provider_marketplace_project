import 'dart:convert';

class Provider {
  final int id;
  final String name;
  final String description;
  // final Image image;

  Provider(this.id, this.name, this.description);
  factory Provider.fromJson(dynamic json) {
    return Provider(json['id'] as int, json['name'] as String,
        json['description'] as String);
  }
}
