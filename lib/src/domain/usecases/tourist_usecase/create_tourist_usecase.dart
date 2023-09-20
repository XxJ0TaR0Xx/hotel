// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';

import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';

@Injectable()
class CreateTouristUsecase extends UseCase<Tourist, CreateTouristUseCaseParams> {
  @override
  Future<Either<Failure, Tourist>> call(CreateTouristUseCaseParams params) {
    final TouristRepository touristRepository = servisec.get<TouristRepository>();

    return touristRepository.createTourist(
      name: params.name,
      surname: params.surname,
      dateOfBirh: params.dateOfBirh,
      citizenship: params.citizenship,
      passportNumber: params.passportNumber,
      passportValidityPeriod: params.passportValidityPeriod,
    );
  }
}

class CreateTouristUseCaseParams {
  final String name;
  final String surname;
  final DateTime dateOfBirh;
  final String citizenship;
  final int passportNumber;
  final int passportValidityPeriod;

  CreateTouristUseCaseParams({
    required this.name,
    required this.surname,
    required this.dateOfBirh,
    required this.citizenship,
    required this.passportNumber,
    required this.passportValidityPeriod,
  });
}
