import 'package:dio/dio.dart';
import 'package:hotel/src/data/models/room_model.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';

class RoomDatasour {
  final Dio dio;
  RoomDatasour({required this.dio});

  static const String httpRooms = 'http://127.0.0.1:1337/api/rooms/';

  Future<List<RoomModel>> getAllRoomModel() async {
    try {
      final Response response = await dio.request(
        httpRooms,
        options: Options(
          method: 'GET',
        ),
      );

      StatusCodeHandler.check(response.statusCode.toString());

      List listData = response.data['data'];
      List<RoomModel> roomModelList = [];

      listData.forEach((element) {
        roomModelList.add(RoomModel.fromMap(element));
      });

      return roomModelList;
    } catch (_) {
      rethrow;
    }
  }

  Future<RoomModel> getOneRoomModel({required int id}) async {
    try {
      final Response response = await dio.request(
        '$httpRooms$id',
        options: Options(
          method: 'GET',
        ),
      );

      StatusCodeHandler.check(response.statusCode.toString());

      return RoomModel.fromMap(response.data['data']);
    } catch (_) {
      rethrow;
    }
  }
}
