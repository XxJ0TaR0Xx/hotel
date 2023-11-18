import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/domain/entities/hotel.dart';
import 'package:hotel/src/domain/usecases/get_all_hotel_usecase.dart';
import 'package:hotel/src/presentation/pages/forbidden_page.dart';
import 'package:injectable/injectable.dart';

const String loading = 'Loading';

@Singleton()
class HotelController with ChangeNotifier {
  final GetAllHotelUseCase getAllHotelUseCase;

  HotelController({
    required this.getAllHotelUseCase,
  });

  List<String>? _imageUrls;
  List<String> get imageUrls => _imageUrls ?? ['https://cdn.lowgif.com/full/eb3afcc902e61559-.gif'];

  List<String>? _listPeculiarities;
  List<String> get listPeculiarities => _listPeculiarities ?? [loading];

  int? _intEstimation;
  int get intEstimation => _intEstimation ?? 0;

  String? _textEstimation;
  String get textEstimation => _textEstimation ?? loading;

  String? _nameHotel;
  String get nameHotel => _nameHotel ?? loading;

  String? _addressHotel;
  String get addressHotel => _addressHotel ?? loading;

  int? _priceHotel;
  int get priceHotel => _priceHotel ?? 0;

  String? _priceForIt;
  String get priceForIt => _priceForIt ?? loading;

  String? _description;
  String get description => _description ?? loading;

  void getListImages() async {
    final Either<Failure, List<Hotel>> serverResultOrError = await getAllHotelUseCase.call(unit);

    serverResultOrError.fold(
      (l) {
        return const ForbiddenPage();
      },
      (r) {
        final Hotel hotel = r[0];
        _imageUrls = hotel.imageUrls;
        _listPeculiarities = hotel.peculiarities;
        _intEstimation = hotel.rating;
        _textEstimation = hotel.ratingName;
        _nameHotel = hotel.name;
        _addressHotel = hotel.adress;
        _priceHotel = hotel.minimalPrice;
        _priceForIt = hotel.priceForIt;
        _description = hotel.description;
      },
    );
    notifyListeners();
  }
}
