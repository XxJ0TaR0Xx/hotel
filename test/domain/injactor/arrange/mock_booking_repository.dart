import 'package:dartz/dartz.dart';
import 'package:hotel/src/domain/entities/booking.dart';
import 'package:mockito/mockito.dart';

import '../../test_repositories.mocks.dart';

//! correct booking
Booking correctBooking = Booking(
  id: 1,
  hotelName: "Лучший пятизвездочный отель в Хургаде, Египет",
  hotelAdress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
  horating: 5,
  ratingName: "Превосходно",
  departure: "Москва",
  arrivalCountry: "Египет, Хургада",
  tourDateStart: DateTime.parse('19.09.2023'),
  tourDateStop: DateTime.parse("27.09.2023"),
  numberOfNights: 7,
  room: "Люкс номер с видом на море",
  nutrition: 'Все включено',
  tourPrice: 289400,
  fuelCharge: 9300,
  serviceCharge: 2150,
);

//! incorrect booking
Booking incorrectBooking = Booking(
  id: -1,
  hotelName: "",
  hotelAdress: "",
  horating: -5,
  ratingName: "",
  departure: "",
  arrivalCountry: "",
  tourDateStart: DateTime.parse('2023 09 19'),
  tourDateStop: DateTime.parse("27.09.2023"),
  numberOfNights: -7,
  room: "",
  nutrition: '',
  tourPrice: -1,
  fuelCharge: -1,
  serviceCharge: -1,
);

MockBookingRepository arrangeMockBookingRepository() {
  MockBookingRepository mockBookingRepository = MockBookingRepository();

  when(mockBookingRepository.getBooking()).thenAnswer((_) async {
    return Right(correctBooking);
  });
  return mockBookingRepository;
}
