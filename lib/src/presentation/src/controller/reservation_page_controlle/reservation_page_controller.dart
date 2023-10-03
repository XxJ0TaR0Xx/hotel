import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/domain/entities/booking.dart';
import 'package:hotel/src/domain/entities/customer.dart';
import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/usecases/get_booking_usecase.dart';
import 'package:hotel/src/domain/usecases/post_cusomer_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:hotel/src/presentation/src/controller/hotel_page_controller/hotel_controller.dart';
import 'package:hotel/src/presentation/src/pages/forbidden_page.dart';
import 'package:hotel/src/presentation/src/widget/reservation_page_widget/tourist_widget.dart';

import 'package:injectable/injectable.dart';

@Singleton()
class ReservationController with ChangeNotifier {
  late final CreateTouristUsecase? createTouristUsecase;
  late final GetBookingUseCase? getBookingUseCase;
  late final PostCustomerUseCase? postCustomerUseCase;
  late List<Widget> _tourists;

  ReservationController() {
    createTouristUsecase = CreateTouristUsecase();
    getBookingUseCase = GetBookingUseCase();
    postCustomerUseCase = PostCustomerUseCase();

    _tourists = [
      TouristWidget(
        countTourist: 'Первый турист',
        listAtributes: listAtributes,
        controller: TextEditingController(),
      ),
      TouristWidget(
        countTourist: 'Второй турист',
        listAtributes: listAtributes,
        controller: TextEditingController(),
      ),
    ];
  }

  Booking? _booking;
  Booking get booking =>
      _booking ??
      Booking(
        id: 0,
        hotelName: loading,
        hotelAdress: loading,
        horating: 0,
        ratingName: loading,
        departure: loading,
        arrivalCountry: loading,
        tourDateStart: DateTime.now(),
        tourDateStop: DateTime.now(),
        numberOfNights: 0,
        room: loading,
        nutrition: loading,
        tourPrice: 0,
        fuelCharge: 0,
        serviceCharge: 0,
      );

  final List<String> listAtributes = [
    'Имя',
    'Фамилия',
    'Дата рождения',
    'Гражданство',
    'Номер загранпаспорта',
    'Срок действия загранпаспорта',
  ];

  List<Widget> get tourists => _tourists;

  void createTourist({required CreateTouristUseCaseParams createTouristUseCaseParams}) async {
    final Either<Failure, Tourist>? serverResultOrError = await createTouristUsecase?.call(createTouristUseCaseParams);

    if (serverResultOrError != null) {
      serverResultOrError.fold(
        (l) {
          return const ForbiddenPage();
        },
        (r) {
          return r;
        },
      );
    }

    notifyListeners();
  }

  void createCustomer({required String number, required String email}) async {
    final Either<Failure, Customer>? serverResultOrError = await postCustomerUseCase?.call(Customer(id: 0, email: email, number: number));

    print('YESSSSSSSS IT IS WORK');

    if (serverResultOrError != null) {
      serverResultOrError.fold(
        (l) {
          return const ForbiddenPage();
        },
        (r) {
          print('RRRRRRR: $r');
          return r;
        },
      );
    }

    notifyListeners();
  }

  void getBooking() async {
    final Either<Failure, Booking>? serverResultOrFailure = await getBookingUseCase?.call(unit);

    if (serverResultOrFailure != null) {
      serverResultOrFailure.fold(
        (l) {
          return const ForbiddenPage();
        },
        (r) {
          return _booking = r;
        },
      );
    }

    notifyListeners();
  }

  void addTourist({required TouristWidget touristWidget}) {
    tourists.add(touristWidget);
    notifyListeners();
  }
}
