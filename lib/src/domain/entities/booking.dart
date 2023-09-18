// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Bookibg {
  final String id;
  final String hotelName;
  final String hotelAdress;
  final String horating;
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final String numberOfNights;
  final String room;
  final String nutrition;
  final String tourPrice;
  final String fuelCharge;
  final String serviceCharge;

  Bookibg({
    required this.id,
    required this.hotelName,
    required this.hotelAdress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });
}
