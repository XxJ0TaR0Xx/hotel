import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/src/data/models/bookind_model.dart';

BookingModel correctBooking = BookingModel(
  id: 1,
  hotelName: "Лучший пятизвездочный отель в Хургаде, Египет",
  hotelAdress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
  horating: 5,
  ratingName: "Превосходно",
  departure: "Москва",
  arrivalCountry: "Египет, Хургада",
  tourDateStart: DateTime.parse('2023-09-18 17:31:02.638'),
  tourDateStop: DateTime.parse("2023-09-27 17:31:02.638"),
  numberOfNights: 7,
  room: "Люкс номер с видом на море",
  nutrition: 'Все включено',
  tourPrice: 289400,
  fuelCharge: 9300,
  serviceCharge: 2150,
);

Future<void> main() async {
  group('methods BookingModel test', () {
    group('method fromMap', () {
      test('correct test', () async {
        final File file = File('test/data/artifacts/models/booking/correct_booking_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);

        // ignore: prefer_function_declarations_over_variables
        final BookingModel? Function() result = () {
          try {
            return BookingModel.fromMap(jsonValue);
          } catch (e) {
            return null;
          }
        };

        expect(result(), correctBooking);
      });

      test('incorrect test', () async {
        final File file = File('test/data/artifacts/models/booking/incorrect_booking_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);

        // ignore: prefer_function_declarations_over_variables
        final BookingModel? Function() result = () {
          try {
            return BookingModel.fromMap(jsonValue);
          } catch (e) {
            return null;
          }
        };

        expect(result(), null);
      });
    });

    group('method FromJson test', () {
      test('correct test', () async {
        final File file = File('test/data/artifacts/models/booking/correct_booking_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // ignore: prefer_function_declarations_over_variables
        final BookingModel? Function() result = () {
          try {
            return BookingModel.fromJson(jsonData);
          } catch (e) {
            return null;
          }
        };

        expect(result(), correctBooking);
      });

      test('incorrect test', () async {
        final File file = File('test/data/artifacts/models/booking/incorrect_booking_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // ignore: prefer_function_declarations_over_variables
        final BookingModel? Function() result = () {
          try {
            return BookingModel.fromJson(jsonData);
          } catch (e) {
            return null;
          }
        };

        expect(result(), null);
      });
    });
  });
}
