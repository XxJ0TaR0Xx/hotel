import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/data/data_errors/data_errors.dart';
import 'package:hotel/src/data/datasource/room_datasource.dart';
import 'package:hotel/src/data/failures/trace_failures.dart';
import 'package:hotel/src/domain/entities/room.dart';
import 'package:hotel/src/domain/repositories/room_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RoomRepository)
class RoomRepositoryImpl implements RoomRepository {
  final RoomDatasour roomDatasour;

  RoomRepositoryImpl({required this.roomDatasour});

  @override
  Future<Either<Failure, List<Room>>> getAllRooms() async {
    try {
      List<Room> roomList = await roomDatasour.getAllRoomModel();

      return Right(roomList);
    } on BadRequestError {
      return const Left(BadRequestFailure(StackTrace.empty));
    } on UnauthorizedError {
      return const Left(UnauthorizedFailure(StackTrace.empty));
    } on (
      ForbiddenError,
      NotFoundError,
      InternalServerError,
      UndefiendError,
    ) {
      return const Left(ExtraFailure(StackTrace.empty));
    } catch (_) {
      rethrow;
    }
  }
}
