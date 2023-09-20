import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';
import 'package:hotel/src/domain/entities/hotel.dart';
import 'package:hotel/src/domain/repositories/hotel_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAllHotelUseCase extends UseCase<List<Hotel>, Unit> {
  @override
  Future<Either<Failure, List<Hotel>>> call(Unit params) {
    final HotelRepository hotelRepository = servisec.get<HotelRepository>();

    return hotelRepository.getAllHotel();
  }
}
