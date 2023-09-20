import 'dart:async';

import 'package:hotel/core/validator/validator.dart';

class HotelValidator extends Validator {
  @override
  FutureOr<bool> validate(String t) {
    if (t.length != 17) return false;
    return RegExp(r'\d{17}').hasMatch(t);
  }
}
