import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/domain/entities/booking.dart';
import 'package:hotel/src/domain/entities/customer.dart';
import 'package:hotel/src/domain/entities/tourist.dart';
import 'package:hotel/src/domain/usecases/get_booking_usecase.dart';
import 'package:hotel/src/domain/usecases/post_cusomer_usecase.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:hotel/src/domain/validator/add_email_validator.dart';
import 'package:hotel/src/domain/validator/add_number_validator.dart';
import 'package:hotel/src/presentation/pages/forbidden_page.dart';
import 'package:hotel/src/presentation/widget/reservation_page_widget/tourist_widget.dart';

import 'package:injectable/injectable.dart';

@Singleton()
class ReservationController with ChangeNotifier {
  final CreateTouristUsecase createTouristUsecase;
  final GetBookingUseCase getBookingUseCase;
  final PostCustomerUseCase postCustomerUseCase;
  final AddNumberValidator addNumberValidator;
  final AddEmailValidator addEmailValidator;

  late List<Widget> _tourists;

  ReservationController(
    this.createTouristUsecase,
    this.getBookingUseCase,
    this.postCustomerUseCase,
    this.addNumberValidator,
    this.addEmailValidator,
  ) {
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
        hotelName: 'loading',
        hotelAdress: 'loading',
        horating: 0,
        ratingName: 'loading',
        departure: 'loading',
        arrivalCountry: 'loading',
        tourDateStart: DateTime.now(),
        tourDateStop: DateTime.now(),
        numberOfNights: 0,
        room: 'loading',
        nutrition: 'loading',
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

  bool? _phoneRedFlag;
  bool get phoneRedFlag => _phoneRedFlag ?? false;

  bool? _emailRedFlag;
  bool get emailRedFlag => _emailRedFlag ?? false;

  List<Widget> get tourists => _tourists;

  void checkPhone({required String str}) {
    _phoneRedFlag = addNumberValidator.validate(str);
    notifyListeners();
  }

  void checkEmail({required String str}) {
    _emailRedFlag = addEmailValidator.validate(str);
    notifyListeners();
  }

  void createTourist({required CreateTouristUseCaseParams createTouristUseCaseParams}) async {
    final Either<Failure, Tourist> serverResultOrError = await createTouristUsecase.call(createTouristUseCaseParams);

    serverResultOrError.fold(
      (l) {
        return const ForbiddenPage();
      },
      (r) {
        return r;
      },
    );

    notifyListeners();
  }

  void createCustomer({
    required String number,
    required String email,
  }) async {
    final Either<Failure, Customer> serverResultOrError = await postCustomerUseCase.call(Customer(id: 0, email: email, number: number));

    serverResultOrError.fold(
      (l) {
        return const ForbiddenPage();
      },
      (r) {
        return r;
      },
    );

    notifyListeners();
  }

  void getBooking() async {
    final Either<Failure, Booking> serverResultOrFailure = await getBookingUseCase.call(unit);

    serverResultOrFailure.fold(
      (l) {
        return const ForbiddenPage();
      },
      (r) {
        return _booking = r;
      },
    );

    notifyListeners();
  }

  void addTourist({required TouristWidget touristWidget}) {
    tourists.add(touristWidget);
    notifyListeners();
  }
}