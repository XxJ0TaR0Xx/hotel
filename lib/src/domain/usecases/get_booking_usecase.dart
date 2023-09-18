import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';
import 'package:hotel/src/domain/entities/booking.dart';
import 'package:hotel/src/domain/repositories/booking_repositore.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetBookingUseCase extends UseCase<Booking, Unit> {
  @override
  Future<Either<Failure, Booking>> call(Unit params) {
    final BookingRepository bookingRepository = servisec.get<BookingRepository>();

    return bookingRepository.getBooking();
  }
}
