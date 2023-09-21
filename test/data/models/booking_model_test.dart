import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/src/data/models/bookind_model.dart';

final BookingModel correctBookingModel = BookingModel(
  id: 1,
  hotelName: 'Лучший пятизвездочный отель в Хургаде, Египет',
  hotelAdress: 'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
  horating: 5,
  ratingName: 'Превосходно',
  departure: 'Москва',
  arrivalCountry: 'Египет, Хургада',
  tourDateStart: DateTime(2023, 09, 21),
  tourDateStop: DateTime(2023, 09, 21),
  numberOfNights: 7,
  room: 'Люкс номер с видом на море',
  nutrition: 'Все включено',
  tourPrice: 289400,
  fuelCharge: 9300,
  serviceCharge: 2150,
);

final Map<String, dynamic> correctMap = {
  "id": 1,
  "attributes": {
    "hotel_name": "Лучший пятизвездочный отель в Хургаде, Египет",
    "hotel_adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
    "horating": 5,
    "rating_name": "Превосходно",
    "departure": "Москва",
    "arrival_country": "Египет, Хургада",
    "tour_date_start": "2023-09-21",
    "tour_date_stop": "2023-09-21",
    "number_of_nights": 7,
    "room": "Люкс номер с видом на море",
    "nutrition": "Все включено",
    "tour_price": 289400,
    "fuel_charge": 9300,
    "service_charge": 2150,
  }
};

final Map<String, dynamic> incorrectMap = {
  "id": 0,
  "attributes": {
    "hotel_name": "string",
    "tour_price": 0,
    "fuel_charge": 0,
    "service_charge": 0,
  }
};

Future<void> main() async {
  group('methods BookingModel test', () {
    group('method fromMap', () {
      test('correct test', () {
        // ignore: prefer_function_declarations_over_variables
        final BookingModel? Function() result = () {
          try {
            return BookingModel.fromMap(correctMap);
          } catch (e) {
            return null;
          }
        };

        expect(result(), correctBookingModel);
      });

      test('incorrect test', () {
        // ignore: prefer_function_declarations_over_variables
        final BookingModel? Function() result = () {
          try {
            return BookingModel.fromMap(incorrectMap);
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

        expect(result(), correctBookingModel);
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

    group('method toMap test', () {
      test('correct test', () {
        final Map<String, dynamic> result = correctBookingModel.toMap();

        expect(result, correctMap);
      });
    });

    group('method toJson test', () {
      test('correct test', () async {
        final String result = correctBookingModel.toJson();

        final File file = File('test/data/artifacts/models/booking/correct_booking_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        expect(result, jsonData);
      });
    });

    group('method copyWith', () {
      test('correct test', () {
        final BookingModel bookingModel = BookingModel(
          id: 1,
          hotelName: '',
          hotelAdress: '',
          horating: 5,
          ratingName: '',
          departure: 'Москва',
          arrivalCountry: 'Египет, Хургада',
          tourDateStart: DateTime(2023 - 09 - 21),
          tourDateStop: DateTime(2023 - 09 - 21),
          numberOfNights: 7,
          room: 'Люкс номер с видом на море',
          nutrition: 'Все включено',
          tourPrice: 0,
          fuelCharge: 0,
          serviceCharge: 0,
        );

        final BookingModel result = correctBookingModel.copyWith(
          hotelName: '',
          hotelAdress: '',
          ratingName: '',
          tourPrice: 0,
          fuelCharge: 0,
          serviceCharge: 0,
        );

        expect(result, bookingModel);
      });
    });
  });
}
