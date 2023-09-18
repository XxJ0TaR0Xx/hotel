import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/domain/entities/hotel.dart';

abstract class HotelRepository {
  Future<Either<Failure, List<Hotel>>> getHotel();
}
