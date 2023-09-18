import 'package:hotel/src/domain/repositories/booking_repositore.dart';
import 'package:hotel/src/domain/repositories/hotel_repository.dart';
import 'package:hotel/src/domain/repositories/room_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<RoomRepository>(), MockSpec<HotelRepository>(), MockSpec<BookingRepository>()])
import 'test_repositories.mocks.dart';
