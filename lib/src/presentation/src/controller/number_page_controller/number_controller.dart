import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/domain/entities/room.dart';
import 'package:hotel/src/domain/usecases/get_all_rooms_usecase.dart';
import 'package:hotel/src/presentation/src/controller/hotel_page_controller/hotel_controller.dart';
import 'package:hotel/src/presentation/src/pages/forbidden_page.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class NumberController with ChangeNotifier {
  late final GetAllRoomsUseCase? getAllRoomsUseCase;

  NumberController() {
    getAllRoomsUseCase = GetAllRoomsUseCase();
  }

  int? _lenghtRoomList;
  int get lenghtRoomList => _lenghtRoomList ?? 0;

  Room? _room;
  Room get room => _room ?? const Room(id: 0, name: loading, price: 0, pricePer: loading, peculiarities: [loading], imageUrls: ['https://cdn.lowgif.com/full/eb3afcc902e61559-.gif']);

  List<Room> listRooms = [];

  void getAllNumbesr() async {
    final Either<Failure, List<Room>>? serverResultOrError = await getAllRoomsUseCase?.call(unit);

    if (serverResultOrError != null) {
      serverResultOrError.fold(
        (l) {
          return const ForbiddenPage();
        },
        (r) {
          _lenghtRoomList = r.length;
          return listRooms = r;
        },
      );
    }

    notifyListeners();
  }

  void getNumberById({required int numberId}) {
    if (listRooms.isNotEmpty) {
      _room = listRooms[numberId];
    }
  }
}
