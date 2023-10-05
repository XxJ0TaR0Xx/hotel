import 'package:flutter/material.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/presentation/src/app.dart';
import 'package:hotel/src/presentation/src/controller/hotel_page_controller/hotel_controller.dart';
import 'package:hotel/src/presentation/src/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/src/controller/reservation_page_controlle/reservation_page_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  HotelController hotelController = HotelController();
  NumberController numberController = NumberController();
  ReservationController reservationController = ReservationController();

  runApp(App(
    hotelController: hotelController,
    numberController: numberController,
    reservationController: reservationController,
  ));
}
