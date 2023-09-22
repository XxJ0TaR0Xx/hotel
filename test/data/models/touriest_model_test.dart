// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/src/data/models/tourist_model.dart';

void main() async {
  group('Tourist_Model_Test', () {
    group('factory fromMap', () {
      test('correct test', () async {
        // Act.
        File file = File('test/data/artifacts/models/touriest/correct_touriest_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);

        // Arrange.
        final TouristModel? Function() result = () {
          try {
            return TouristModel.fromMap(jsonValue);
          } catch (_) {
            return null;
          }
        };

        // Accert.
        expect(
            result(),
            TouristModel(
              id: 1,
              name: 'Admin',
              surname: 'Admin',
              dateOfBirh: DateTime.parse('2023-08-31'),
              citizenship: 'РФ',
              passportNumber: 1,
              passportValidityPeriod: 1,
            ));
      });

      test('incorrect test', () async {
        // Act.
        File file = File('test/data/artifacts/models/touriest/incorrect_touriest_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);

        // Arrange.
        final TouristModel? Function() result = () {
          try {
            return TouristModel.fromMap(jsonValue);
          } catch (_) {
            return null;
          }
        };

        // Accert.
        expect(result(), null);
      });
    });
    group('factory fromJson', () {
      test('correct test', () async {
        // Act.
        File file = File('test/data/artifacts/models/touriest/correct_touriest_json.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // Arrange.
        final TouristModel? Function() result = () {
          try {
            return TouristModel.fromJson(jsonData);
          } catch (e) {
            return null;
          }
        };

        // Accert.
        expect(
            result(),
            TouristModel(
              id: 1,
              name: 'Admin',
              surname: 'Admin',
              dateOfBirh: DateTime.parse('2023-08-31'),
              citizenship: 'РФ',
              passportNumber: 1,
              passportValidityPeriod: 1,
            ));
      });
      test('incorrect test', () async {
        // Act.
        File file = File('test/data/artifacts/models/touriest/incorrect_touriest_json.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // Arrange.
        final TouristModel? Function() result = () {
          try {
            return TouristModel.fromJson(jsonData);
          } catch (e) {
            return null;
          }
        };

        // Accert.
        expect(result(), null);
      });
    });

    group('method toMap', () {
      test('correct test', () {
        // Act.
        // Arrange.
        // Accert.
      });

      test('incorrect test', () {
        // Act.
        // Arrange.
        // Accert.
      });
    });

    group('method toJson', () {
      test('correct test', () {
        // Act.
        // Arrange.
        // Accert.
      });

      test('incorrect test', () {
        // Act.
        // Arrange.
        // Accert.
      });
    });
  });
}
