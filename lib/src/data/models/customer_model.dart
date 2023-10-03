// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hotel/src/domain/entities/customer.dart';

class CustomerModel extends Customer {
  const CustomerModel({
    required super.id,
    required super.email,
    required super.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': {
        'email': email,
        'number': number,
      }
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> attributesMap = map['attributes'];
    return CustomerModel(
      id: map['id'] as int,
      email: attributesMap['email'] as String,
      number: attributesMap['number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) => CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
