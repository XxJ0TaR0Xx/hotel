// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  // about_the_hotel
  final String description;
  final List<String> peculiarities;

  @override
  List<Object> get props {
    return [
      id,
    ];
  }

  Hotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.description,
    required this.peculiarities,
  });
}
