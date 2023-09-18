import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:hotel/src/domain/repositories/booking_repositore.dart';
import 'package:hotel/src/domain/repositories/hotel_repository.dart';
import 'package:hotel/src/domain/repositories/room_repository.dart';

import '../test_repositories.mocks.dart';

final GetIt testServices = GetIt.I;

FutureOr<void> initMockTestServices() {
  final RoomRepository roomRepository = MockRoomRepository();
  final BookingRepository bookingRepository = MockBookingRepository();
  final HotelRepository hotelRepository = MockHotelRepository();

  testServices.registerLazySingleton<RoomRepository>(() => arrangeMockRoomRepository());
  testServices.registerLazySingleton<BookingRepository>(() => ());
  testServices.registerLazySingleton<HotelRepository>(() => ());
}
