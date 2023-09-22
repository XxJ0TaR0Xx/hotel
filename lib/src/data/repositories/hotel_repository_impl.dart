import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/data/data_errors/data_errors.dart';
import 'package:hotel/src/data/datasource/hotel_datasource.dart';
import 'package:hotel/src/data/failures/trace_failures.dart';
import 'package:hotel/src/domain/entities/hotel.dart';
import 'package:hotel/src/domain/repositories/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelDatasource hotelDatasource;

  HotelRepositoryImpl({required this.hotelDatasource});

  @override
  Future<Either<Failure, List<Hotel>>> getAllHotel() async {
    try {
      List<Hotel> hotelList = await hotelDatasource.getHotelModel();

      return Right(hotelList);
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
