import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/src/controller/reservation_page_controlle/reservation_page_controller.dart';
import 'package:hotel/src/presentation/src/pages/reservation_page.dart';
import 'package:hotel/src/presentation/src/widget/big_text_widget.dart';
import 'package:hotel/src/presentation/src/widget/container_widget.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/about_hote.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/button_to_number.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/carousel_image.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/price_of_hotel.dart';

class NumberCard extends StatefulWidget {
  final String numberDiscription;
  final int priceHotel;
  final String priceForIt;
  final List<String> listImages;
  final List<String> peculiarities;
  final NumberController numberController;
  final ReservationController reservationController;
  const NumberCard({
    super.key,
    required this.numberDiscription,
    required this.priceHotel,
    required this.priceForIt,
    required this.listImages,
    required this.peculiarities,
    required this.numberController,
    required this.reservationController,
  });

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: MyContainer(
          rad: 12.0,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselImage(listImages: widget.listImages),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: BigText(text: widget.numberDiscription),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AboutHotel(peculiarities: widget.peculiarities),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: const EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      bottom: 16.0,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF0D72FF).withOpacity(0.1),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Подробнее о номере',
                            style: TextStyle(
                              color: Color(0xFF0D72FF),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 19.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              PriceOfHotel(
                priceHotel: widget.priceHotel,
                priceForIt: widget.priceForIt,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: ButtonToNumber(
                  text: 'Выбрать номер',
                  destination: ReservationPage(
                    numberController: widget.numberController,
                    reservationController: widget.reservationController,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
