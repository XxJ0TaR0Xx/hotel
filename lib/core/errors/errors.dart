import 'package:equatable/equatable.dart';

abstract class Errors extends Equatable {
  final StackTrace stackTrace;

  @override
  List<Object> get props => [stackTrace];

  const Errors({
    required this.stackTrace,
  });
}
