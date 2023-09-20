import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:hotel/src/domain/entities/tourist.dart';

@Injectable()
class UpdateTouristUsecase extends UseCase<Tourist, UpdateTouristUseCaseParams> {
  @override
  Future<Either<Failure, Tourist>> call(UpdateTouristUseCaseParams params) {
    final TouristRepository touristRepository = servisec.get<TouristRepository>();

    return touristRepository.updateTourist(
      id: params.id,
      name: params.name,
      surname: params.surname,
      dateOfBirh: params.dateOfBirh,
      citizenship: params.citizenship,
      passportNumber: params.passportNumber,
      passportValidityPeriod: params.passportValidityPeriod,
    );
  }
}

class UpdateTouristUseCaseParams {
  final int id;
  final String? name;
  final String? surname;
  final DateTime? dateOfBirh;
  final String? citizenship;
  final int? passportNumber;
  final int? passportValidityPeriod;

  UpdateTouristUseCaseParams({
    required this.id,
    this.name,
    this.surname,
    this.dateOfBirh,
    this.citizenship,
    this.passportNumber,
    this.passportValidityPeriod,
  });
}
