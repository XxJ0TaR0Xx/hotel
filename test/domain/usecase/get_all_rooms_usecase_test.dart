import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/domain/entities/room.dart';
import 'package:hotel/src/domain/repositories/room_repository.dart';
import 'package:hotel/src/domain/usecases/get_all_rooms_usecase.dart';
import 'package:mockito/mockito.dart';

import '../injactor/servises.dart';

void main() async {
  await initMockTestServices();
  await initUsecaseTestServises();

  group('Get_All_Rooms_Usecase test', () {
    test('correct test', () async {
      // Act
      final RoomRepository roomRepository = servisec<RoomRepository>();
      final GetAllRoomsUseCase getAllRoomsUseCase = servisec<GetAllRoomsUseCase>();

      // Arrange
      final Either<Failure, List<Room>> failureOrListRooms = await getAllRoomsUseCase.call(unit);

      // Accert
      expect(failureOrListRooms.isRight(), true);
      verify(getAllRoomsUseCase.call(unit)).called(1);
      verifyNoMoreInteractions(roomRepository);
    });

    test('incorrect test', () async {
      // Act
      final RoomRepository roomRepository = servisec<RoomRepository>();
      final GetAllRoomsUseCase getAllRoomsUseCase = servisec<GetAllRoomsUseCase>();

      // Arrange
      final Either<Failure, List<Room>> failureOrListRooms = await getAllRoomsUseCase.call(unit);

      // Accert
      expect(failureOrListRooms.isLeft(), true);
      verifyNoMoreInteractions(roomRepository);
    });
  });
}
