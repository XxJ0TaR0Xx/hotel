import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:hotel/src/domain/repositories/booking_repository.dart';
import 'package:hotel/src/domain/repositories/hotel_repository.dart';
import 'package:hotel/src/domain/repositories/room_repository.dart';
import 'package:hotel/src/domain/usecases/get_all_hotel_usecase.dart';
import 'package:hotel/src/domain/usecases/get_all_rooms_usecase.dart';
import 'package:hotel/src/domain/usecases/get_booking_usecase.dart';

import '../test_repositories.mocks.dart';
import 'arrange/mock_booking_repository.dart';
import 'arrange/mock_hotel_repository.dart';
import 'arrange/mock_room_repository.dart';

final GetIt testServices = GetIt.I;

FutureOr<void> initMockTestServices() {
  final RoomRepository roomRepository = MockRoomRepository();
  final BookingRepository bookingRepository = MockBookingRepository();
  final HotelRepository hotelRepository = MockHotelRepository();

  testServices.registerLazySingleton<RoomRepository>(() => arrangeMockRoomRepository());
  testServices.registerLazySingleton<BookingRepository>(() => arrangeMockBookingRepository());
  testServices.registerLazySingleton<HotelRepository>(() => arrangeMockHotelRepository());
}

FutureOr<void> initUsecaseTestServises() {
  //! for GetAllHotelUseCase
  testServices.registerLazySingleton<GetAllHotelUseCase>(() => GetAllHotelUseCase());

  //! for GetAllRoomsUseCase
  testServices.registerLazySingleton<GetAllRoomsUseCase>(() => GetAllRoomsUseCase());

  //! for GetBookingUseCase
  testServices.registerLazySingleton<GetBookingUseCase>(() => GetBookingUseCase());
}
