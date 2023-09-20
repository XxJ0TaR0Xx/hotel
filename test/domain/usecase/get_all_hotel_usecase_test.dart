import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/domain/entities/hotel.dart';
import 'package:hotel/src/domain/repositories/hotel_repository.dart';
import 'package:hotel/src/domain/usecases/get_all_hotel_usecase.dart';
import 'package:mockito/mockito.dart';

import '../injactor/servises.dart';

void main() async {
  await initMockTestServices();
  await initUsecaseTestServises();
  group('Get_All_Hotel_Usecase test', () {
    test('correct test', () async {
      //Act
      final HotelRepository hotelRepository = servisec<HotelRepository>();
      final GetAllHotelUseCase getAllHotelUseCase = servisec<GetAllHotelUseCase>();

      //Arrange
      final Either<Failure, List<Hotel>> failureOrListHotel = await getAllHotelUseCase.call(unit);

      //Accert
      expect(failureOrListHotel.isRight(), true);
      verify(hotelRepository.getAllHotel()).called(1);
      verifyNoMoreInteractions(hotelRepository);
    });

    test('incorret test', () async {
      //Act
      final HotelRepository hotelRepository = servisec<HotelRepository>();
      final GetAllHotelUseCase getAllHotelUseCase = servisec<GetAllHotelUseCase>();

      //Arrange
      final Either<Failure, List<Hotel>> failureOrListHotel = await getAllHotelUseCase.call(unit);

      //Accert
      expect(failureOrListHotel.isLeft(), true);
      verify(hotelRepository.getAllHotel()).called(1);
      verifyNoMoreInteractions(hotelRepository);
    });
  });
}
