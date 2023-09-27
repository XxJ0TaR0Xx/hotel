import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/controller/hotel_page_controller/hotel_controller.dart';
import 'package:hotel/src/presentation/src/pages/forbidden_page.dart';
import 'package:hotel/src/presentation/src/pages/hotel_page.dart';
import 'package:hotel/src/presentation/src/pages/number_page.dart';
import 'package:hotel/src/presentation/src/pages/paid_for_page.dart';
import 'package:hotel/src/presentation/src/pages/reservation_page.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class App extends StatelessWidget {
  late final HotelController hotelController;

  App({super.key}) {
    hotelController = HotelController();
  }

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
                return HotelPage(hotelController: hotelController);

              case NumberPage.route:
                return const NumberPage();

              case ReservationPage.route:
                return const ReservationPage();

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
