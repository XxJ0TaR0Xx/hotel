import 'package:hotel/core/validator/validator.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AddEmailValidator extends Validator<String> {
  @override
  bool validate(String t) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
      multiLine: false,
    );

    return regex.hasMatch(t);
  }
}
