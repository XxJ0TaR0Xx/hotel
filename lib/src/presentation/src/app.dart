import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/controller/hotel_page_controller/hotel_controller.dart';
import 'package:hotel/src/presentation/src/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/src/controller/reservation_page_controlle/reservation_page_controller.dart';
import 'package:hotel/src/presentation/src/pages/forbidden_page.dart';
import 'package:hotel/src/presentation/src/pages/hotel_page.dart';
import 'package:hotel/src/presentation/src/pages/number_page.dart';
import 'package:hotel/src/presentation/src/pages/paid_for_page.dart';
import 'package:hotel/src/presentation/src/pages/reservation_page.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class App extends StatelessWidget {
  final HotelController hotelController;
  final NumberController numberController;
  final ReservationController reservationController;

  const App({
    super.key,
    required this.hotelController,
    required this.numberController,
    required this.reservationController,
  });

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
                  hotelController: hotelController,
                  numberController: numberController,
                  reservationController: reservationController,
                );

              case NumberPage.route:
                return NumberPage(
                  numberController: numberController,
                  reservationController: reservationController,
                );

              case ReservationPage.route:
                return ReservationPage(
                  numberController: numberController,
                  reservationController: reservationController,
                );

              case PaidFor.route:
                return PaidFor(
                  numberController: numberController,
                  reservationController: reservationController,
                );

              default:
                return const ForbiddenPage();
            }
          },
        );
      },
    );
  }
}
