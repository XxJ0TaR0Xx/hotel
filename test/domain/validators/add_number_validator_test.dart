import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/src/domain/validator/add_number_validator.dart';

void main() {
  String correctNumber01 = '+7-900-123-45-67';

  String correctNumber02 = '8-900-123-45-67';

  String incorrectNumber01 = '+7-123-456-78-90';

  String incorrectNumber02 = '12345';

  String incorrectNumber03 = '';

  group('Add number validator', () {
    final AddNumberValidator addNumberValidator = AddNumberValidator();

    test('Correct Input Value 01', () async {
      // Arrange.
      final bool result = addNumberValidator.validate(correctNumber01);
      // Assert.
      expect(result, true);
    });

    test('Correct Input Value 02', () async {
      // Arrange.
      final bool result = addNumberValidator.validate(correctNumber02);
      // Assert.
      expect(result, true);
    });

    test('Incorrect Input Value 01', () async {
      // Arrange.
      final bool result = addNumberValidator.validate(incorrectNumber01);
      // Assert.
      expect(result, false);
    });

    test('Incorrect Input Value 02', () async {
      // Arrange.
      final bool result = addNumberValidator.validate(incorrectNumber02);
      // Assert.
      expect(result, false);
    });

    test('Incorrect Input Value 03', () async {
      // Arrange.
      final bool result = addNumberValidator.validate(incorrectNumber03);
      // Assert.
      expect(result, false);
    });
  });
}
