import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/pages/forbidden_page.dart';
import 'package:hotel/src/presentation/src/pages/hotel_page.dart';
import 'package:hotel/src/presentation/src/pages/number_page.dart';
import 'package:hotel/src/presentation/src/pages/paid_for_page.dart';
import 'package:hotel/src/presentation/src/pages/reservation_page.dart';

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
                return const HotelPage();

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
