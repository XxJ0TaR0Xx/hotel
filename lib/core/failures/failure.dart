// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String notice;

  const Failure({
    required this.notice,
  });

  @override
  List<Object?> get props => [notice];
}
