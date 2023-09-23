import 'package:dartz/dartz.dart';
import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/update_tourist_usecase.dart';

import '../../../core/failures/failure.dart';

abstract class TouristRepository {
  Future<Either<Failure, Tourist>> createTourist({required CreateTouristUseCaseParams createTouristParams});

  Future<Either<Failure, Tourist>> findOneTourist({required int id});

  Future<Either<Failure, List<Tourist>>> findAllTourist();

  Future<Either<Failure, Unit>> deleteTorist({required int id});

  Future<Either<Failure, Tourist>> updateTourist({required UpdateTouristUseCaseParams updateTouristUseCaseParams});
}
