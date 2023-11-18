// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final int id;
  final String email;
  final String number;

  const Customer({
    required this.id,
    required this.email,
    required this.number,
  });

  @override
  List<Object?> get props => [id];
}
