// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:hotel/src/domain/repositories/tourist_repository.dart';

import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';

@Injectable()
class DeleteTouristUsecase extends UseCase<Unit, DeleteTouristUseCaseParams> {
  @override
  Future<Either<Failure, Unit>> call(DeleteTouristUseCaseParams params) {
    final TouristRepository touristRepository = servisec.get<TouristRepository>();

    return touristRepository.deleteTorist(
      id: params.id,
    );
  }
}

class DeleteTouristUseCaseParams {
  final int id;

  DeleteTouristUseCaseParams({
    required this.id,
  });
}
