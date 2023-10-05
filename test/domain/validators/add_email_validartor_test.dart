import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/src/domain/validator/add_email_validator.dart';

void main() {
  String correctEmail01 = 'example@email.com';

  String correctEmail02 = 'example@email.com';

  String incorrectEmail01 = 'example@.com';

  String incorrectEmail02 = 'example@domain.c';

  String incorrectEmail03 = '';

  group('Add email Validator', () {
    final AddEmailValidator addEmailValidator = AddEmailValidator();

    test('Correct test 01', () async {
      // Arrange.
      final bool result = await addEmailValidator.validate(correctEmail01);
      // Assert.
      expect(result, true);
    });

    test('Correct test 02', () async {
      // Arrange.
      final bool result = await addEmailValidator.validate(correctEmail02);
      // Assert.
      expect(result, true);
    });

    test('Incorrect test 01', () async {
      // Arrange.
      final bool result = await addEmailValidator.validate(incorrectEmail01);
      // Assert.
      expect(result, false);
    });

    test('Incorrect test 02', () async {
      // Arrange.
      final bool result = await addEmailValidator.validate(incorrectEmail02);
      // Assert.
      expect(result, false);
    });

    test('Incorrect test 03', () async {
      // Arrange.
      final bool result = await addEmailValidator.validate(incorrectEmail03);
      // Assert.
      expect(result, false);
    });
  });
}
