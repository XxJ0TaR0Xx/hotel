import 'package:dio/dio.dart';
import 'package:hotel/src/data/models/bookind_model.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';

class BookingDatasource {
  final Dio dio;
  BookingDatasource({required this.dio});

  static const String httpBookings = 'http://127.0.0.1:1337/api/bookings/1';

  Future<BookingModel> getBookingModel() async {
    try {
      final Response response = await dio.request(
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
