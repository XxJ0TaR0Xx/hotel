// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:hotel/src/domain/repositories/booking_repository.dart';
import 'package:hotel/src/domain/repositories/hotel_repository.dart';
import 'package:hotel/src/domain/repositories/room_repository.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';
import 'package:hotel/src/domain/usecases/get_all_hotel_usecase.dart';
import 'package:hotel/src/domain/usecases/get_all_rooms_usecase.dart';
import 'package:hotel/src/domain/usecases/get_booking_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/delete_tourist_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/find_all_tourist_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/find_tourist_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/update_tourist_usecase.dart';

import '../test_repositories.mocks.dart';
import 'arrange/mock_booking_repository.dart';
import 'arrange/mock_hotel_repository.dart';
import 'arrange/mock_room_repository.dart';
import 'arrange/mock_tourist_repository.dart';

final GetIt testServices = GetIt.I;

FutureOr<void> initMockTestServices() {
  testServices.registerLazySingleton<RoomRepository>(() => arrangeMockRoomRepository());
  testServices.registerLazySingleton<TouristRepository>(() => arrangeMockTouristRepository());
  testServices.registerLazySingleton<BookingRepository>(() => arrangeMockBookingRepository());
  testServices.registerLazySingleton<HotelRepository>(() => arrangeMockHotelRepository());
}

FutureOr<void> initUsecaseTestServises() {
  //! GROUP TOURIST
  //! for CreateTouristUsecase
  testServices.registerLazySingleton<CreateTouristUsecase>(() => CreateTouristUsecase());

  //! for UpdateTouristUsecase
  testServices.registerLazySingleton<UpdateTouristUsecase>(() => UpdateTouristUsecase());

  //! for DeleteTouristUsecase
  testServices.registerLazySingleton<DeleteTouristUsecase>(() => DeleteTouristUsecase());

  //! for FindOneTouristUsecase
  testServices.registerLazySingleton<FindTouristUsecase>(() => FindTouristUsecase());

  //! for FindAllTouristUsecase
  testServices.registerLazySingleton<FindAllTouristUsecase>(() => FindAllTouristUsecase());

  ///////////////////////

  //! GROUP HOTEL
  //! for GetAllHotelUseCase
  testServices.registerLazySingleton<GetAllHotelUseCase>(() => GetAllHotelUseCase());

  ///////////////////////

  //! GROUP ROOM
  //! for GetAllRoomsUseCase
  testServices.registerLazySingleton<GetAllRoomsUseCase>(() => GetAllRoomsUseCase());

  ///////////////////////

  //! GROUP BOOKIN
  //! for GetBookingUseCase
  testServices.registerLazySingleton<GetBookingUseCase>(() => GetBookingUseCase());

  ///////////////////////
}
