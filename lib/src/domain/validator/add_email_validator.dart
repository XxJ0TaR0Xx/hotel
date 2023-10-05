import 'dart:async';

import 'package:hotel/core/validator/validator.dart';

class AddEmailValidator extends Validator<String> {
  @override
  FutureOr<bool> validate(String t) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
      multiLine: false,
    );

    return regex.hasMatch(t);
  }
}
