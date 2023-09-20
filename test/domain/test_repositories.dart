// ignore_for_file: unused_import

import 'package:hotel/src/domain/repositories/booking_repository.dart';
import 'package:hotel/src/domain/repositories/hotel_repository.dart';
import 'package:hotel/src/domain/repositories/room_repository.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<RoomRepository>(), MockSpec<HotelRepository>(), MockSpec<BookingRepository>(), MockSpec<TouristRepository>()])
import 'test_repositories.mocks.dart';
