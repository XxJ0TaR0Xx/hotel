import 'dart:convert';

import 'package:hotel/src/domain/entities/tourist.dart';

class TouristModel extends Tourist {
  const TouristModel({
    required super.id,
    required super.name,
    required super.surname,
    required super.dateOfBirh,
    required super.citizenship,
    required super.passportNumber,
    required super.passportValidityPeriod,
  });

  TouristModel copyWith({
    int? id,
    String? name,
    String? surname,
    DateTime? dateOfBirh,
    String? citizenship,
    int? passportNumber,
    int? passportValidityPeriod,
  }) {
    return TouristModel(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      dateOfBirh: dateOfBirh ?? this.dateOfBirh,
      citizenship: citizenship ?? this.citizenship,
      passportNumber: passportNumber ?? this.passportNumber,
      passportValidityPeriod: passportValidityPeriod ?? this.passportValidityPeriod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attributes': {
        'name': name,
        'surname': surname,
        'Date_of_birth': dateOfBirh,
        'citizenship': citizenship,
        'passport_number': passportNumber,
        'Passport_validity_period': passportValidityPeriod,
      },
    };
  }

  factory TouristModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> mapAttributes = map['attributes'];
    return TouristModel(
      id: map['id'] as int,
      name: mapAttributes['name'] as String,
      surname: mapAttributes['surname'] as String,
      dateOfBirh: DateTime.parse(mapAttributes['Date_of_birth']),
      citizenship: mapAttributes['citizenship'] as String,
      passportNumber: mapAttributes['passport_number'] as int,
      passportValidityPeriod: mapAttributes['Passport_validity_period'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TouristModel.fromJson(String source) => TouristModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TouristModel(id: $id, name: $name, surname: $surname, dateOfBirh: $dateOfBirh, citizenship: $citizenship, passportNumber: $passportNumber, passportValidityPeriod: $passportValidityPeriod)';
  }
}
