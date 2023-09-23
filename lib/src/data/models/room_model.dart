import 'dart:convert';

import 'package:hotel/src/domain/entities/room.dart';

class RoomModel extends Room {
  const RoomModel({
    required super.id,
    required super.name,
    required super.price,
    required super.pricePer,
    required super.peculiarities,
    required super.imageUrls,
  });

  RoomModel copyWith({
    int? id,
    String? name,
    int? price,
    String? pricePer,
    List<String>? peculiarities,
    List<String>? imageUrls,
  }) {
    return RoomModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      pricePer: pricePer ?? this.pricePer,
      peculiarities: peculiarities ?? this.peculiarities,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> mapAttributes = map['attributes'];
    List<String> listPeculiarities = mapAttributes['peculiarities'].toString().split(',');
    List<String> listImageUrls = mapAttributes['image_urls'].toString().split(',');
    return RoomModel(
      id: map['id'] as int,
      name: mapAttributes['name'] as String,
      price: mapAttributes['price'] as int,
      pricePer: mapAttributes['price_per'] as String,
      peculiarities: listPeculiarities,
      imageUrls: listImageUrls,
    );
  }

  factory RoomModel.fromJson(String source) => RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoomModel(id: $id, name: $name, price: $price, pricePer: $pricePer, peculiarities: $peculiarities, imageUrls: $imageUrls)';
  }
}
