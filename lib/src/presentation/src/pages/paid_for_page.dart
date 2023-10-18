import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/controller/hotel_page_controller/hotel_controller.dart';
import 'package:hotel/src/presentation/src/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/src/controller/reservation_page_controlle/reservation_page_controller.dart';
import 'package:hotel/src/presentation/src/pages/hotel_page.dart';
import 'package:hotel/src/presentation/src/widget/botton_button_widget.dart';
import 'package:hotel/src/presentation/src/widget/my_app_bar_widget.dart';
import 'package:hotel/src/presentation/src/widget/big_text_widget.dart';
import 'package:hotel/src/presentation/src/widget/small_text_widget.dart';

class PaidFor extends StatelessWidget {
  static const String route = '/number/reservation/paidfor';
  final NumberController numberController; // перенести эти контроллеры в контроелеры
  final ReservationController reservationController;

  const PaidFor({
    super.key,
    required this.numberController,
    required this.reservationController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: 'Заказ оплачен',
        pathIcon: 'assets/arrow_back.svg',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset('assets/paid_for.png'),
          const SizedBox(height: 32.0),
          const BigText(text: 'Ваш заказ принят в работу'),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 23.0,
              vertical: 20.0,
            ),
            child: SmallText(text: 'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black12),
                ),
                color: Color(0xFFFFFFFF),
              ),
              child: BottonButton(
                text: 'Супер!',
                destination: HotelPage(
                  hotelController: HotelController(),
                  numberController: numberController,
                  reservationController: reservationController,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
