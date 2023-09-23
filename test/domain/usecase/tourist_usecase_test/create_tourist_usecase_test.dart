import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/failure/failure.dart';
import 'package:hotel/src/domain/repositories/tourist_repository.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../injactor/arrange/mock_tourist_repository.dart';
import '../../injactor/servises.dart';

Future<void> main() async {
  await initMockTestServices();
  await initUsecaseTestServises();
  group('Create_Usecase', () {
    test('correct test', () async {
      // Act.
      final TouristRepository touristRepository = servisec<TouristRepository>();
      final CreateTouristUsecase createTouristUseCase = servisec<CreateTouristUsecase>();

      // Arrange.
      final Either<Failure, Tourist> failureOrTourist = await createTouristUseCase.call(createTouristUseCaseParams);

      // Accert.
      expect(failureOrTourist, Right(correctTourist));
      verify(createTouristUseCase.call(createTouristUseCaseParams)).called(1);
      verifyNoMoreInteractions(touristRepository);
    });

    test('incorrect test', () async {
      // Act.
      final CreateTouristUsecase createTouristUseCase = servisec<CreateTouristUsecase>();

      // Arrange.
      final Either<Failure, Tourist> failureOrTourist = await createTouristUseCase.call(incorectParams);

      // Accert.
      expect(failureOrTourist, const Left(DeadInsideRequest()));
    });
  });
}
