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

  //DateUtils.dateOnly(dateOfBirh)
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': {
        'Name': name,
        'Surname': surname,
        'Date_of_birth': '${dateOfBirh.year}-0${dateOfBirh.month}-${dateOfBirh.day}',
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
      name: mapAttributes['Name'] as String,
      surname: mapAttributes['Surname'] as String,
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
