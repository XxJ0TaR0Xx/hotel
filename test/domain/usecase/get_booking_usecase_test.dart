import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/domain/entities/booking.dart';
import 'package:hotel/src/domain/repositories/booking_repository.dart';
import 'package:hotel/src/domain/usecases/get_booking_usecase.dart';
import 'package:mockito/mockito.dart';

import '../injactor/servises.dart';

Future<void> main() async {
  await initMockTestServices();
  await initUsecaseTestServises();

  group('Get_All_Booking_Usecase test', () {
    test('correct test', () async {
      // Act
      final BookingRepository bookingRepository = servisec<BookingRepository>();
      final GetBookingUseCase getBookingUseCase = servisec<GetBookingUseCase>();

      // Arrange
      final Either<Failure, Booking> failureOrListRooms = await getBookingUseCase.call(unit);

      // Accert
      expect(failureOrListRooms.isRight(), true);
      verify(bookingRepository.getBooking()).called(1);
      verifyNoMoreInteractions(bookingRepository);
    });
  });
}
