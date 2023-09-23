// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hotel/src/domain/entities/booking.dart';

class BookingModel extends Booking {
  const BookingModel({
    required super.id,
    required super.hotelName,
    required super.hotelAdress,
    required super.horating,
    required super.ratingName,
    required super.departure,
    required super.arrivalCountry,
    required super.tourDateStart,
    required super.tourDateStop,
    required super.numberOfNights,
    required super.room,
    required super.nutrition,
    required super.tourPrice,
    required super.fuelCharge,
    required super.serviceCharge,
  });

  BookingModel copyWith({
    int? id,
    String? hotelName,
    String? hotelAdress,
    int? horating,
    String? ratingName,
    String? departure,
    String? arrivalCountry,
    DateTime? tourDateStart,
    DateTime? tourDateStop,
    int? numberOfNights,
    String? room,
    String? nutrition,
    int? tourPrice,
    int? fuelCharge,
    int? serviceCharge,
  }) {
    return BookingModel(
      id: id ?? this.id,
      hotelName: hotelName ?? this.hotelName,
      hotelAdress: hotelAdress ?? this.hotelAdress,
      horating: horating ?? this.horating,
      ratingName: ratingName ?? this.ratingName,
      departure: departure ?? this.departure,
      arrivalCountry: arrivalCountry ?? this.arrivalCountry,
      tourDateStart: tourDateStart ?? this.tourDateStart,
      tourDateStop: tourDateStop ?? this.tourDateStop,
      numberOfNights: numberOfNights ?? this.numberOfNights,
      room: room ?? this.room,
      nutrition: nutrition ?? this.nutrition,
      tourPrice: tourPrice ?? this.tourPrice,
      fuelCharge: fuelCharge ?? this.fuelCharge,
      serviceCharge: serviceCharge ?? this.serviceCharge,
    );
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> attributesMap = map['attributes'];
    return BookingModel(
      id: map['id'] as int,
      hotelName: attributesMap['hotel_name'] as String,
      hotelAdress: attributesMap['hotel_adress'] as String,
      horating: attributesMap['horating'] as int,
      ratingName: attributesMap['rating_name'] as String,
      departure: attributesMap['departure'] as String,
      arrivalCountry: attributesMap['arrival_country'] as String,
      tourDateStart: DateTime.parse(attributesMap['tour_date_start']),
      tourDateStop: DateTime.parse(attributesMap['tour_date_stop']),
      numberOfNights: attributesMap['number_of_nights'] as int,
      room: attributesMap['room'] as String,
      nutrition: attributesMap['nutrition'] as String,
      tourPrice: attributesMap['tour_price'] as int,
      fuelCharge: attributesMap['fuel_charge'] as int,
      serviceCharge: attributesMap['service_charge'] as int,
    );
  }
  //for you
  factory BookingModel.fromJson(String source) => BookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingModel(id: $id, hotelName: $hotelName, hotelAdress: $hotelAdress, horating: $horating, ratingName: $ratingName, departure: $departure, arrivalCountry: $arrivalCountry, tourDateStart: $tourDateStart, tourDateStop: $tourDateStop, numberOfNights: $numberOfNights, room: $room, nutrition: $nutrition, tourPrice: $tourPrice, fuelCharge: $fuelCharge, serviceCharge: $serviceCharge)';
  }
}
