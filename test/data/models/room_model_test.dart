// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/src/data/models/room_model.dart';

void main() async {
  group('Room_Model_Test', () {
    group('factory fromMap', () {
      test('correct test', () async {
        // Act.
        final File file = File('test/data/artifacts/models/room/correct_room_json.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);

        print(jsonValue);
        // Arrange.
        final RoomModel? Function() result = () {
          try {
            return RoomModel.fromMap(jsonValue);
          } catch (_) {
            return null;
          }
        };

        // Accert.
        expect(
            result(),
            const RoomModel(
              id: 1,
              name: "Стандартный номер с видом на бассейн",
              price: 186600,
              pricePer: 'За 7 ночей с перелетом',
              peculiarities: ['Включен только завтрак, Кондиционер'],
              imageUrls: [
                'https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg',
                'https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=',
                'https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg',
              ],
            ));
      });
      test('incorrect test', () async {
        // Act.
        File file = File('test/data/artifacts/models/room/incorrect_room_json.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        // Arrange.
        final RoomModel? Function() result = () {
          try {
            return RoomModel.fromMap(jsonValue);
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
        File file = File('test/data/artifacts/models/room/correct_room_json.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);
        // Arrange.
        final RoomModel? Function() result = () {
          try {
            return RoomModel.fromJson(jsonData);
          } catch (_) {
            return null;
          }
        };

        // Accert.
        expect(
            result(),
            const RoomModel(
              id: 1,
              name: "Стандартный номер с видом на бассейн",
              price: 186600,
              pricePer: 'За 7 ночей с перелетом',
              peculiarities: ['Включен только завтрак, Кондиционер'],
              imageUrls: [
                'https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg, https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=,\n        https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg\n      '
              ],
            ));
      });
      test('incorrect test', () async {
        // Act.
        File file = File('test/data/artifacts/models/room/incorrect_room_json.json');
        if (!(await file.exists())) throw Exception('File does\'t exist');

        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // Arrange.
        final RoomModel? Function() result = () {
          try {
            return RoomModel.fromJson(jsonData);
          } catch (_) {
            return null;
          }
        };

        // Accert.
        expect(result(), null);
      });
    });
  });
}
