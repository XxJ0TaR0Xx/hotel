import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/domain/entities/booking.dart';

abstract class BookingRepository {
  Future<Either<Failure, Booking>> getBooking();
}
