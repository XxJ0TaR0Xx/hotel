import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/data/data_errors/data_errors.dart';
import 'package:hotel/src/data/datasource/tourist_datasource.dart';
import 'package:hotel/src/data/failures/trace_failures.dart';
import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/update_tourist_usecase.dart';

class TouristrepositoriImpl implements TouristRepository {
  final TouristDatasource touristDatasource;
  TouristrepositoriImpl({required this.touristDatasource});

  @override
  Future<Either<Failure, Tourist>> createTourist({required CreateTouristUseCaseParams createTouristParams}) async {
    try {
      Tourist tourist = await touristDatasource.createTourist(createTouristUseCaseParams: createTouristParams);

      return Right(tourist);
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

  @override
  Future<Either<Failure, Unit>> deleteTorist({required int id}) {
    // TODO: implement deleteTorist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tourist>>> findAllTourist() {
    // TODO: implement findAllTourist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tourist>> findOneTourist({required int id}) {
    // TODO: implement findOneTourist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tourist>> updateTourist({required UpdateTouristUseCaseParams updateTouristUseCaseParams}) {
    // TODO: implement updateTourist
    throw UnimplementedError();
  }
}
