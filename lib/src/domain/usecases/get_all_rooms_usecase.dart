import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';
import 'package:hotel/src/domain/entities/room.dart';
import 'package:hotel/src/domain/repositories/room_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAllRoomsUseCase extends UseCase<List<Room>, Unit> {
  @override
  Future<Either<Failure, List<Room>>> call(Unit params) {
    final RoomRepository roomRepository = servisec.get<RoomRepository>();

    return roomRepository.getAllRooms();
  }
}
