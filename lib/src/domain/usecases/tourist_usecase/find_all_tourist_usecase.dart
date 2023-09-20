import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';

import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';

@Injectable()
class FindAllTouristUsecase extends UseCase<List<Tourist>, Unit> {
  @override
  Future<Either<Failure, List<Tourist>>> call(Unit params) {
    final TouristRepository touristRepository = servisec.get<TouristRepository>();

    return touristRepository.findAllTourist();
  }
}
