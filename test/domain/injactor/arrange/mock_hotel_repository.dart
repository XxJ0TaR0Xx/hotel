import 'package:dartz/dartz.dart';
import 'package:hotel/src/domain/entities/hotel.dart';
import 'package:mockito/mockito.dart';

import '../../test_repositories.mocks.dart';

//! correct hotel
Hotel correctHotel = const Hotel(
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

List<Hotel> listHotel = [correctHotel, correctHotel];

//! incorrect hotel
Hotel incorrectHotel = const Hotel(
  id: -1,
  name: "",
  adress: "",
  minimalPrice: -134268,
  priceForIt: "",
  rating: -5,
  ratingName: "",
  imageUrls: [],
  description: "",
  peculiarities: [],
);

List<Hotel> listHotel2 = [incorrectHotel, incorrectHotel];

MockHotelRepository arrangeMockHotelRepository() {
  MockHotelRepository mockHotelRepository = MockHotelRepository();

  when(mockHotelRepository.getAllHotel()).thenAnswer((_) async {
    return Right(listHotel);
  });

  return mockHotelRepository;
}
