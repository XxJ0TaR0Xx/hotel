import 'package:dartz/dartz.dart';
import 'package:hotel/src/domain/entities/tourist.dart';

import '../../../core/failures/failure.dart';

abstract class TouristRepository {
  Future<Either<Failure, Tourist>> createTourist({
    required String name,
    required String surname,
    required DateTime dateOfBirh,
    required String citizenship,
    required int passportNumber,
    required int passportValidityPeriod,
  });

  Future<Either<Failure, Tourist>> findOneTourist({required int id});

  Future<Either<Failure, List<Tourist>>> findAllTourist();

  Future<Either<Failure, Unit>> deleteTorist({required int id});

  Future<Either<Failure, Tourist>> updateTourist({
    required id,
    name,
    surname,
    dateOfBirh,
    citizenship,
    passportNumber,
    passportValidityPeriod,
  });
}
