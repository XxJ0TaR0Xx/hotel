import 'package:flutter/material.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/presentation/controller/hotel_page_controller/hotel_controller.dart';
import 'package:hotel/src/presentation/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/controller/reservation_page_controlle/reservation_page_controller.dart';
import 'package:hotel/src/presentation/pages/forbidden_page.dart';
import 'package:hotel/src/presentation/pages/hotel_page.dart';
import 'package:hotel/src/presentation/pages/number_page.dart';
import 'package:hotel/src/presentation/pages/paid_for_page.dart';
import 'package:hotel/src/presentation/pages/reservation_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            switch (settings.name) {
              case HotelPage.route:
                return HotelPage(
                  hotelController: servisec<HotelController>(),
                );

              case NumberPage.route:
                return NumberPage(
                  numberController: servisec<NumberController>(),
                );

              case ReservationPage.route:
                return ReservationPage(
                  reservationController: servisec<ReservationController>(),
                );

              case PaidFor.route:
                return const PaidFor();

              default:
                return const ForbiddenPage();
            }
          },
        );
      },
    );
  }
}
