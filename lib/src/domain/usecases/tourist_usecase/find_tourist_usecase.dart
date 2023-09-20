// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';
import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';

@Injectable()
class FindTouristUsecase extends UseCase<Tourist, FindTouristUsecaseParams> {
  @override
  Future<Either<Failure, Tourist>> call(FindTouristUsecaseParams params) {
    final TouristRepository touristRepository = servisec.get<TouristRepository>();

    return touristRepository.findOneTourist(id: params.id);
  }
}

class FindTouristUsecaseParams {
  final int id;

  FindTouristUsecaseParams({
    required this.id,
  });
}
