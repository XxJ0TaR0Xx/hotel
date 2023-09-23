import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/data/data_errors/data_errors.dart';
import 'package:hotel/src/data/datasource/booking_datasource.dart';
import 'package:hotel/src/data/failures/trace_failures.dart';
import 'package:hotel/src/domain/entities/booking.dart';
import 'package:hotel/src/domain/repositories/booking_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BookingRepository)
class BookingRepositoryImpl implements BookingRepository {
  final BookingDatasource bookingDatasource;

  BookingRepositoryImpl({required this.bookingDatasource});

  @override
  Future<Either<Failure, Booking>> getBooking() async {
    try {
      Booking booking = await bookingDatasource.getBookingModel();

      return Right(booking);
    } on BadRequestError {
      return const Left(BadRequestFailure(StackTrace.empty));
    } on UnauthorizedError {
      return const Left(UnauthorizedFailure(StackTrace.empty));
    } on (
      ForbiddenError,
      NotFoundError,
      InternalServerError,
      UndefiendError,
    ) {
      return const Left(ExtraFailure(StackTrace.empty));
    } catch (_) {
      rethrow;
    }
  }
}
