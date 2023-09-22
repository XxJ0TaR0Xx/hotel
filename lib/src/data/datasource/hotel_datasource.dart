import 'package:dio/dio.dart';
import 'package:hotel/src/data/models/hotel_model.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';

class HotelDatasource {
  final Dio dio;
  HotelDatasource({required this.dio});

  static const String httpHotel = 'http://127.0.0.1:1337/api/hotels/';

  Future<List<HotelModel>> getHotelModel() async {
    try {
      final Response response = await dio.request(
        httpHotel,
        options: Options(
          method: 'GET',
        ),
      );

      StatusCodeHandler.check(response.statusCode.toString());

      List listData = response.data['data'];
      List<HotelModel> list = [];

      listData.forEach((element) {
        list.add(HotelModel.fromMap(element));
      });

      return list;
    } catch (_) {
      rethrow;
    }
  }
}