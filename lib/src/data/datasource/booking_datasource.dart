import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/data/models/bookind_model.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';
import 'package:injectable/injectable.dart';

String isAndroid({required String path}) {
  if (Platform.isAndroid) {
    return 'http://192.168.1.71:1337/api/$path/1';
  } else {
    return 'http://127.0.0.1:1337/api/$path/1';
  }
}

@Injectable()
class BookingDatasource {
  final DioModule dio;
  BookingDatasource({required this.dio});

  String httpBookings = isAndroid(path: 'bookings');

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
