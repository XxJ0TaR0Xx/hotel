import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/widget/big_text_widget.dart';
import 'package:hotel/src/presentation/src/widget/bloc_with_hotel_widget.dart';
import 'package:hotel/src/presentation/src/widget/botton_button_widget.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/about_hote.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/carousel_image.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/description_hotel.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/hotel_information_widget.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/price_of_hotel.dart';
import 'package:hotel/src/presentation/src/widget/my_app_bar_widget.dart';
import 'package:hotel/src/presentation/src/widget/my_divider_widget.dart';

final List<String> listImages = [
  'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Privé_by_Belek_Club_House.jpg',
  'https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg',
  'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Privé_by_Belek_Club_House.jpg',
  'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Privé_by_Belek_Club_House.jpg',
];

final List<String> peculiarities = [
  "Бесплатный Wifi на всей территории отеля",
  "1 км до пляжа",
  "Бесплатный фитнес-клуб",
  "20 км до аэропорта",
];

class HotelPage extends StatefulWidget {
  static const String route = '/';
  const HotelPage({super.key});

  @override
  State<StatefulWidget> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: 'Отель'),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              children: [
                CarouselImage(listImages: listImages),
                const BlocHotel(
                  intEstimation: 5,
                  textEstimation: 'Превосходно',
                  nameHotel: 'Steigenberger Makadi',
                  addressHotel:
                      'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                ),
                const PriceOfHotel(
                  priceHotel: 'от 134 673',
                  priceForIt: 'За тур с перелётом',
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [BigText(text: 'Об отеле')],
                  ),
                ),
                AboutHotel(peculiarities: peculiarities),
                const DescriptionHotel(
                  description:
                      'Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!',
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // color: Colors.green,
                      color: Color(0xFFFBFBFC),
                    ),
                    child: const Column(
                      children: [
                        HotelInformation(
                          information: 'Удобства',
                          pathIcon: 'assets/emoji_happy.svg',
                        ),
                        MyDivider(),
                        HotelInformation(
                          information: 'Что включено',
                          pathIcon: 'assets/tick_square.svg',
                        ),
                        MyDivider(),
                        HotelInformation(
                          information: 'Что не включено',
                          pathIcon: 'assets/close_square.svg',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12)),
              color: Color(0xFFFFFFFF),
            ),
            child: const BottonButton(text: 'К выбору номера'),
          ),
        ],
      ),
    );
  }
}
