import 'package:flutter/material.dart';

class BlocReservation extends StatelessWidget {
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final String numberOfNights;
  final String room;
  final String nutrition;
  final String nameHotel;

  const BlocReservation({
    super.key,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.nameHotel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: 16.0,
        left: 16.0,
      ),
      child: Column(
        children: [
          RowForBlockReservation(
            dateDiscription: 'Вылет из',
            date: departure,
          ),
          const SizedBox(height: 16.0),
          RowForBlockReservation(
            dateDiscription: 'Страна, город',
            date: arrivalCountry,
          ),
          const SizedBox(height: 16.0),
          RowForBlockReservation(
            dateDiscription: 'Даты',
            date: "$tourDateStart - $tourDateStop",
          ),
          const SizedBox(height: 16.0),
          RowForBlockReservation(
            dateDiscription: 'Кол-во ночей',
            date: "$numberOfNights ночей",
          ),
          const SizedBox(height: 16.0),
          RowForBlockReservation(
            dateDiscription: 'Отель',
            date: nameHotel,
          ),
          const SizedBox(height: 16.0),
          RowForBlockReservation(
            dateDiscription: 'Номер',
            date: room,
          ),
          const SizedBox(height: 16.0),
          RowForBlockReservation(
            dateDiscription: 'Питание',
            date: nutrition,
          ),
        ],
      ),
    );
  }
}

class RowForBlockReservation extends StatelessWidget {
  final String dateDiscription;
  final String date;
  const RowForBlockReservation({
    super.key,
    required this.dateDiscription,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextReservation(
            text: dateDiscription,
            colorHex: const Color(0xFF828796),
          ),
        ),
        Expanded(
          child: TextReservation(
            text: date,
            colorHex: const Color(0xFF000000),
          ),
        ),
      ],
    );
  }
}

class TextReservation extends StatelessWidget {
  final String text;
  final Color colorHex;
  const TextReservation({
    super.key,
    required this.text,
    required this.colorHex,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: colorHex,
        fontSize: 16.0,
      ),
    );
  }
}
