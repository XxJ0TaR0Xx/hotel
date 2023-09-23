import 'package:dio/dio.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/data/models/tourist_model.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class TouristDatasource {
  final DioModule dio;
  TouristDatasource({required this.dio});

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<TouristModel> createTourist({required CreateTouristUseCaseParams createTouristUseCaseParams}) async {
    TouristModel touristModel = TouristModel(
      id: 0,
      citizenship: createTouristUseCaseParams.citizenship,
      dateOfBirh: createTouristUseCaseParams.dateOfBirh,
      name: createTouristUseCaseParams.name,
      passportNumber: createTouristUseCaseParams.passportNumber,
      passportValidityPeriod: createTouristUseCaseParams.passportValidityPeriod,
      surname: createTouristUseCaseParams.surname,
    );

    Response response = await dio.clietn.request(
      'http://127.0.0.1:1337/api/tourists',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: touristModel.toJson(),
    );

    StatusCodeHandler.check(response.statusCode.toString());

    return TouristModel.fromMap(response.data['data']);
  }
}
