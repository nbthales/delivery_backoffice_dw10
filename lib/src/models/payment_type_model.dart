import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PaymentTypeModel {
  final int? id;
  final String name;
  final String acronym;
  final bool enabled;

  PaymentTypeModel({
    this.id,
    required this.name,
    required this.acronym,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'acronym': acronym,
      'enabled': enabled,
    };
  }

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypeModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: (map['name'] ?? '') as String,
      acronym: (map['acronym'] ?? '') as String,
      enabled: (map['enabled'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypeModel.fromJson(String source) =>
      PaymentTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
