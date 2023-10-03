import 'package:flutter/material.dart';
import 'package:hotel/src/domain/entities/room.dart';
import 'package:hotel/src/presentation/src/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/src/controller/reservation_page_controlle/reservation_page_controller.dart';
import 'package:hotel/src/presentation/src/widget/my_app_bar_widget.dart';
import 'package:hotel/src/presentation/src/widget/number_page_widget/number_cadr.dart';

class NumberPage extends StatelessWidget {
  static const String route = '/number';
  final NumberController numberController;
  final ReservationController reservationController;
  const NumberPage({
    super.key,
    required this.numberController,
    required this.reservationController,
  });

  @override
  Widget build(BuildContext context) {
    numberController.getAllNumbesr();

    return Scaffold(
      appBar: const MyAppBar(
        text: 'Steigenberger Makadi',
        pathIcon: 'assets/arrow_back.svg',
      ),
      body: AnimatedBuilder(
        animation: numberController,
        builder: (BuildContext context, Widget? child) {
          return ListView.builder(
            itemCount: numberController.lenghtRoomList,
            itemBuilder: (BuildContext context, int index) {
              numberController.getNumberById(numberId: index);
              final Room room = numberController.room;

              return NumberCard(
                numberDiscription: room.name,
                priceHotel: room.price,
                priceForIt: room.pricePer,
                listImages: room.imageUrls,
                peculiarities: room.peculiarities,
                numberController: numberController,
                reservationController: reservationController,
              );
            },
          );
        },
      ),
    );
  }
}
