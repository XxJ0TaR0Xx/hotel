import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/widget/hotel_page_widget/address_of_hotel.dart';
import 'package:hotel/src/presentation/widget/hotel_page_widget/estimation_hotel.dart';
import 'package:hotel/src/presentation/widget/hotel_page_widget/name_of_hotel.dart';

class BlocHotel extends StatelessWidget {
  final int intEstimation;
  final String textEstimation;
  final String nameHotel;
  final String addressHotel;

  const BlocHotel({
    super.key,
    required this.intEstimation,
    required this.textEstimation,
    required this.nameHotel,
    required this.addressHotel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EstimationHotel(
          intEstimation: intEstimation,
          textEstimation: textEstimation,
        ),
        NameOfHotel(nameHotel: nameHotel),
        AddressOfHotel(addressHotel: addressHotel),
      ],
    );
  }
}
