import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/controller/hotel_page_controller/hotel_controller.dart';
import 'package:hotel/src/presentation/src/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/src/controller/reservation_page_controlle/reservation_page_controller.dart';
import 'package:hotel/src/presentation/src/pages/number_page.dart';
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

class HotelPage extends StatelessWidget {
  static const String route = '/';
  final HotelController hotelController;
  final NumberController numberController;
  final ReservationController reservationController;
  const HotelPage({
    super.key,
    required this.hotelController,
    required this.numberController,
    required this.reservationController,
  });

  @override
  Widget build(BuildContext context) {
    hotelController.getListImages();
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
                AnimatedBuilder(
                  animation: hotelController,
                  builder: (_, __) {
                    return CarouselImage(listImages: hotelController.imageUrls);
                  },
                ),
                AnimatedBuilder(
                  animation: hotelController,
                  builder: (BuildContext context, Widget? child) {
                    return BlocHotel(
                      intEstimation: hotelController.intEstimation,
                      textEstimation: hotelController.textEstimation,
                      nameHotel: hotelController.nameHotel,
                      addressHotel: hotelController.addressHotel,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: hotelController,
                  builder: (BuildContext context, Widget? child) {
                    return PriceOfHotel(
                      priceHotel: hotelController.priceHotel,
                      priceForIt: hotelController.priceForIt,
                    );
                  },
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
                AnimatedBuilder(
                  animation: hotelController,
                  builder: (BuildContext context, Widget? child) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: AboutHotel(peculiarities: hotelController.listPeculiarities),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: hotelController,
                  builder: (BuildContext context, Widget? child) {
                    return DescriptionHotel(
                      description: hotelController.description,
                    );
                  },
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
            child: BottonButton(
              text: 'К выбору номера',
              destination: NumberPage(
                numberController: numberController,
                reservationController: reservationController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
