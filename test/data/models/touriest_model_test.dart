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

    test('Method toMap Test', () {
      // Act.
      final Map<String, dynamic> correctMap = {
        'id': 1,
        'attributes': {
          'name': 'Admin',
          'surname': 'Admin',
          'Date_of_birth': DateTime.parse('2023-08-31'),
          'citizenship': 'РФ',
          'passport_number': 1,
          'Passport_validity_period': 1,
        }
      };

      final TouristModel touristModel = TouristModel(
        id: 1,
        name: 'Admin',
        surname: 'Admin',
        dateOfBirh: DateTime.parse('2023-08-31'),
        citizenship: 'РФ',
        passportNumber: 1,
        passportValidityPeriod: 1,
      );

      // Arrange.
      final Map<String, dynamic> result = touristModel.toMap();

      // Assert.
      expect(result, correctMap);
    });

    test('Method toJson Test', () {
      // Act.

      final String correctJSON = jsonEncode({
        "id": 1,
        "data": {
          'name': 'Admin',
          'surname': 'Admin',
          'Date_of_birth': '2023-08-31',
          'citizenship': 'РФ',
          'passport_number': 1,
          'Passport_validity_period': 1,
        },
      });

      final TouristModel touristModel = TouristModel(
        id: 1,
        name: 'Admin',
        surname: 'Admin',
        // DateTime(now.year, now.month, now.day)
        // 'Date_of_birth': '${dateOfBirh.year}-0${dateOfBirh.month}-${dateOfBirh.day}',
        dateOfBirh: DateTime('${2023.year},'),
        citizenship: 'РФ',
        passportNumber: 1,
        passportValidityPeriod: 1,
      );

      print(touristModel);
      // Arrange.
      final String result = touristModel.toJson();

      // Assert.
      expect(result, correctJSON);
    });
  });
}
