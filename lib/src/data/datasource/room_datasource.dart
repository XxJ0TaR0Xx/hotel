import 'package:dio/dio.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/data/models/room_model.dart';
import 'package:hotel/src/data/utils/api_config.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RoomDatasour {
  final DioModule dio;
  RoomDatasour({required this.dio});

  String httpRooms = '${ApiConfig.apiUri}rooms';

  Future<List<RoomModel>> getAllRoomModel() async {
    try {
      final Response response = await dio.clietn.request(
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
      final Response response = await dio.clietn.request(
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
