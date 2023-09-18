import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/domain/entities/room.dart';

abstract class RoomRepository {
  Future<Either<Failure, List<Room>>> getAllRooms();
}
