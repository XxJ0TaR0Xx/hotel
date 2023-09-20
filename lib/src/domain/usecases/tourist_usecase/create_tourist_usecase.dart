// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/services/servisec.dart';
import '../../../../core/usecase/usecase.dart';

@Injectable()
class GetAllHotelUseCase extends UseCase<Tourist, CreateTouristUseCaseParams> {
  @override
  Future<Either<Failure, Tourist>> call(CreateTouristUseCaseParams params) {
    final TouristRepository touristRepository = servisec.get<TouristRepository>();

    return touristRepository.createTourist(
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

class CreateTouristUseCaseParams {
  final int id;
  final String name;
  final String surname;
  final DateTime dateOfBirh;
  final String citizenship;
  final int passportNumber;
  final int passportValidityPeriod;

  CreateTouristUseCaseParams({
    required this.id,
    required this.name,
    required this.surname,
    required this.dateOfBirh,
    required this.citizenship,
    required this.passportNumber,
    required this.passportValidityPeriod,
  });
}
