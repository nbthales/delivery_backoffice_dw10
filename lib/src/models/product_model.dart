import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductModel {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String image;
  final bool enabled;
  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'enabled': enabled,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: (map['name'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
      image: (map['image'] ?? '') as String,
      enabled: (map['enabled'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
