import 'package:flutter/material.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/domain/entities/room.dart';
import 'package:hotel/src/presentation/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/controller/reservation_page_controlle/reservation_page_controller.dart';
import 'package:hotel/src/presentation/widget/common_widgets/my_app_bar_widget.dart';
import 'package:hotel/src/presentation/widget/number_page_widget/number_cadr.dart';

class NumberPage extends StatelessWidget {
  static const String route = '/number';
  final NumberController numberController;
  const NumberPage({
    super.key,
    required this.numberController,
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
                reservationController: servisec<ReservationController>(),
              );
            },
          );
        },
      ),
    );
  }
}
