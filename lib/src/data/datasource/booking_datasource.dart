import 'package:dio/dio.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/data/models/bookind_model.dart';
import 'package:hotel/src/data/utils/api_config.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class BookingDatasource {
  final DioModule dio;
  BookingDatasource({required this.dio});

  String httpBookings = '${ApiConfig.apiUri}bookings/1';

  Future<BookingModel> getBookingModel() async {
    try {
      final Response response = await dio.clietn.request(
        httpBookings,
        options: Options(
          method: 'GET',
        ),
      );

      StatusCodeHandler.check(response.statusCode.toString());

      return BookingModel.fromMap(response.data['data']);
    } catch (_) {
      rethrow;
    }
  }
}
