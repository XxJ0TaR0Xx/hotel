import 'dart:convert';

import 'package:hotel/src/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required super.id,
    required super.name,
    required super.adress,
    required super.minimalPrice,
    required super.priceForIt,
    required super.rating,
    required super.ratingName,
    required super.imageUrls,
    required super.description,
    required super.peculiarities,
  });

  HotelModel copyWith({
    int? id,
    String? name,
    String? adress,
    int? minimalPrice,
    String? priceForIt,
    int? rating,
    String? ratingName,
    List<String>? imageUrls,
    String? description,
    List<String>? peculiarities,
  }) {
    return HotelModel(
      id: id ?? this.id,
      name: name ?? this.name,
      adress: adress ?? this.adress,
      minimalPrice: minimalPrice ?? this.minimalPrice,
      priceForIt: priceForIt ?? this.priceForIt,
      rating: rating ?? this.rating,
      ratingName: ratingName ?? this.ratingName,
      imageUrls: imageUrls ?? this.imageUrls,
      description: description ?? this.description,
      peculiarities: peculiarities ?? this.peculiarities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attributes': {
        'name': name,
        'adress': adress,
        'minimal_price': minimalPrice,
        'price_for_it': priceForIt,
        'rating': rating,
        'rating_name': ratingName,
        'image_urls': imageUrls.toString(),
        'description': description,
        'peculiarities': peculiarities.toString(),
      },
    };
  }

  factory HotelModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> mapAttributes = map['attributes'];
    List<String> listImageUrls = mapAttributes['imageUrls'].toString().split(',');
    List<String> listPeculiarities = mapAttributes['peculiarities'].toString().split(',');
    return HotelModel(
      id: map['id'] as int,
      name: mapAttributes['name'] as String,
      adress: mapAttributes['adress'] as String,
      minimalPrice: mapAttributes['minimal_price'] as int,
      priceForIt: mapAttributes['price_for_it'] as String,
      rating: mapAttributes['rating'] as int,
      ratingName: mapAttributes['rating_name'] as String,
      imageUrls: listImageUrls,
      description: mapAttributes['description'] as String,
      peculiarities: listPeculiarities,
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelModel.fromJson(String source) => HotelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HotelModel(id: $id, name: $name, adress: $adress, minimalPrice: $minimalPrice, priceForIt: $priceForIt, rating: $rating, ratingName: $ratingName, imageUrls: $imageUrls, description: $description, peculiarities: $peculiarities)';
  }
}
