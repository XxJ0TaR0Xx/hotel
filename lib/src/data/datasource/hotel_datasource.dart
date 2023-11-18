import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/data/models/hotel_model.dart';
import 'package:hotel/src/data/utils/api_config.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HotelDatasource {
  final DioModule dio;
  HotelDatasource({required this.dio});

  String httpHotel = '${ApiConfig.apiUri}hotels';

  Future<List<HotelModel>> getHotelModel() async {
    log('httpHotel $httpHotel');

    try {
      final Response response = await dio.clietn.request(
        httpHotel,
        options: Options(
          method: 'GET',
        ),
      );

      StatusCodeHandler.check(response.statusCode.toString());

      List listData = response.data['data'];
      List<HotelModel> list = [];

      for (var element in listData) {
        list.add(HotelModel.fromMap(element));
      }

      return list;
    } catch (_) {
      rethrow;
    }
  }
}
