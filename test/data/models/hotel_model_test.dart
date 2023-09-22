import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/src/data/models/hotel_model.dart';

HotelModel correctHotel = const HotelModel(
  id: 1,
  name: "Лучший пятизвездочный отель в Хургаде, Египет",
  adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
  minimalPrice: 134268,
  priceForIt: "За тур с перелётом",
  rating: 5,
  ratingName: "Превосходно",
  imageUrls: [
    "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
    "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
    "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg",
  ],
  description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
  peculiarities: ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"],
);

void main() {
  group('methods BookingModel test', () {
    group('method fromMap', () {
      test('correct test', () async {
        File file = File('test/data/artifacts/models/hotel/correct_hotel_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);

        // ignore: prefer_function_declarations_over_variables
        final HotelModel? Function() result = () {
          try {
            return HotelModel.fromMap(jsonValue);
          } catch (e) {
            return null;
          }
        };

        expect(result(), correctHotel);
      });

      test('incorrect test', () async {
        File file = File('test/data/artifacts/models/hotel/incorrect_hotel_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);

        // ignore: prefer_function_declarations_over_variables
        final HotelModel? Function() result = () {
          try {
            return HotelModel.fromMap(jsonValue);
          } catch (e) {
            return null;
          }
        };

        expect(result(), null);
      });
    });

    group('method fromJson', () {
      test('correct test', () async {
        File file = File('test/data/artifacts/models/hotel/correct_hotel_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // ignore: prefer_function_declarations_over_variables
        final HotelModel? Function() result = () {
          try {
            return HotelModel.fromJson(jsonData);
          } catch (e) {
            return null;
          }
        };

        expect(result(), correctHotel);
      });

      test('correct test', () async {
        File file = File('test/data/artifacts/models/hotel/incorrect_hotel_json.json');

        if (!(await file.exists())) throw Exception('File does\'t exist');
        final String string = await file.readAsString();
        final dynamic jsonValue = jsonDecode(string);
        final dynamic jsonData = jsonEncode(jsonValue);

        // ignore: prefer_function_declarations_over_variables
        final HotelModel? Function() result = () {
          try {
            return HotelModel.fromJson(jsonData);
          } catch (e) {
            return null;
          }
        };

        expect(result(), null);
      });
    });
  });
}
