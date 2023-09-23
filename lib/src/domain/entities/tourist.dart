// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Tourist extends Equatable {
  final int id;
  final String name;
  final String surname;
  final DateTime dateOfBirh;
  final String citizenship;
  final int passportNumber;
  final int passportValidityPeriod;

  @override
  List<Object> get props => [id];

  const Tourist({
    required this.id,
    required this.name,
    required this.surname,
    required this.dateOfBirh,
    required this.citizenship,
    required this.passportNumber,
    required this.passportValidityPeriod,
  });
}
