import 'dart:async';

import 'package:hotel/core/validator/validator.dart';

class AddNumberValidator extends Validator<String> {
  @override
  FutureOr<bool> validate(String t) {
    String cleanedPhoneNumber = t.replaceAll(RegExp(r'[\s\-\+]'), '');

    if (RegExp(r'^[0-9]{11}$').hasMatch(cleanedPhoneNumber)) {
      if ((cleanedPhoneNumber.startsWith('7') || cleanedPhoneNumber.startsWith('8')) && cleanedPhoneNumber[1] == '9') {
        return true;
      }
    }

    return false;
  }
}
