import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/widget/my_app_bar_widget.dart';
import 'package:hotel/src/presentation/src/widget/number_page_widget/number_cadr.dart';

List<String> listImages = [
  "https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j0_roskdc_00_p_1024x768.jpg?ritok=65&twic=v1/cover=800x600",
  "https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j0_roskdc_00_p_1024x768.jpg?ritok=65&twic=v1/cover=800x600",
  "https://tour-find.ru/thumb/2/bsb2EIEFA8nm22MvHqMLlw/r/d/screenshot_3_94.png"
];

List<String> listImages2 = [
  "https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg",
  "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=",
  "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg",
];

List<String> peculiarities = [
  "Включен только завтрак",
  "Кондиционер",
];

List<String> peculiarities2 = [
  "Все включено",
  "Кондиционер",
  "Собственный бассейн",
];

class NumberPage extends StatefulWidget {
  static const String route = '/number';
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: 'Steigenberger Makadi',
        pathIcon: 'assets/arrow_back.svg',
      ),
      body: ListView(
        children: [
          NumberCard(
            numberDiscription: 'Стандартный с видом на бассейн или сад',
            priceHotel: '186 600',
            priceForIt: 'за 7 ночей с перелётом',
            listImages: listImages,
            peculiarities: peculiarities,
          ),
          NumberCard(
            numberDiscription: 'Стандартный с видом на бассейн или сад',
            priceHotel: '200 600',
            priceForIt: 'за 5 ночей с перелётом',
            listImages: listImages2,
            peculiarities: peculiarities2,
          ),
        ],
      ),
    );
  }
}
