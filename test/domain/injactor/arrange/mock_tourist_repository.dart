import 'package:dartz/dartz.dart';
import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/failure/failure.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/update_tourist_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../test_repositories.mocks.dart';

// correct create params
final CreateTouristUseCaseParams createTouristUseCaseParams = CreateTouristUseCaseParams(
  citizenship: correctTourist.citizenship,
  dateOfBirh: correctTourist.dateOfBirh,
  name: correctTourist.name,
  passportNumber: correctTourist.passportNumber,
  passportValidityPeriod: correctTourist.passportValidityPeriod,
  surname: correctTourist.surname,
);

// incorrect create params
final CreateTouristUseCaseParams incorectParams = CreateTouristUseCaseParams(
  name: '',
  surname: '',
  dateOfBirh: DateTime.parse("1000-02-27"),
  citizenship: '',
  passportNumber: -12345,
  passportValidityPeriod: -1,
);

//correct id
const int correctId = 1;

//incorrect id
const int incorrectId = -1;

// correct tourist
Tourist correctTourist = Tourist(
  id: 1,
  name: 'David',
  surname: 'Git',
  dateOfBirh: DateTime.parse("2012-02-27"),
  citizenship: 'Russian',
  passportNumber: 12343543322345,
  passportValidityPeriod: 10,
);

// list torist
List<Tourist> listTourist = [correctTourist, correctTourist];

// udate paraps
UpdateTouristUseCaseParams correctupdateTouristParams = UpdateTouristUseCaseParams(
  id: 1,
  name: 'Daniil',
);

// udated tourest
Tourist updatedTourist = Tourist(
  id: 1,
  name: 'Daniil',
  surname: 'Git',
  dateOfBirh: DateTime.parse("2012-02-27"),
  citizenship: 'Russian',
  passportNumber: 12343543322345,
  passportValidityPeriod: 10,
);

// incorrect tourist
Tourist incorrectTourist = Tourist(
  id: -1,
  name: '',
  surname: '',
  dateOfBirh: DateTime.parse("1000-02-27"),
  citizenship: '',
  passportNumber: 12345,
  passportValidityPeriod: 1,
);

MockTouristRepository arrangeMockTouristRepository() {
  MockTouristRepository mockTouristRepository = MockTouristRepository();

  //! for createTourist
  //correct
  when(
    mockTouristRepository.createTourist(createTouristParams: createTouristUseCaseParams),
  ).thenAnswer((_) async => Right(correctTourist));

  //incorrect
  when(
    mockTouristRepository.createTourist(createTouristParams: incorectParams),
  ).thenAnswer((_) async => const Left(DeadInsideRequest()));

  ///////////////////////

  //! for deleteTourist
  when(mockTouristRepository.deleteTorist(id: correctId)).thenAnswer(
    (_) async => const Right(unit),
  );

  ///////////////////////

  //! for findOneTourist
  when(mockTouristRepository.findOneTourist(id: correctId)).thenAnswer(
    (_) async => Right(correctTourist),
  );

  ///////////////////////

  //! for findAllTourist
  when(mockTouristRepository.findAllTourist()).thenAnswer(
    (_) async => Right(listTourist),
  );

  ///////////////////////

  //! for updateTourist
  when(mockTouristRepository.updateTourist(updateTouristUseCaseParams: correctupdateTouristParams)).thenAnswer((_) async => Right(updatedTourist));

  ///////////////////////

  return mockTouristRepository;
}