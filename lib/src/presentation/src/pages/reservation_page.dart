import 'package:flutter/material.dart';
import 'package:hotel/src/domain/entities/booking.dart';
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart';
import 'package:hotel/src/presentation/src/controller/number_page_controller/number_controller.dart';
import 'package:hotel/src/presentation/src/controller/reservation_page_controlle/reservation_page_controller.dart';
import 'package:hotel/src/presentation/src/pages/paid_for_page.dart';
import 'package:hotel/src/presentation/src/widget/big_text_widget.dart';
import 'package:hotel/src/presentation/src/widget/bloc_with_hotel_widget.dart';
import 'package:hotel/src/presentation/src/widget/botton_button_widget.dart';
import 'package:hotel/src/presentation/src/widget/container_widget.dart';
import 'package:hotel/src/presentation/src/widget/my_app_bar_widget.dart';
import 'package:hotel/src/presentation/src/widget/reservation_page_widget/add_tourist_widget.dart';
import 'package:hotel/src/presentation/src/widget/reservation_page_widget/block_reservation_widget.dart';
import 'package:hotel/src/presentation/src/widget/reservation_page_widget/input_text_widget.dart';
import 'package:hotel/src/presentation/src/widget/reservation_page_widget/row_with_price_widget.dart';
import 'package:hotel/src/presentation/src/widget/reservation_page_widget/tourist_widget.dart';
import 'package:hotel/src/presentation/src/widget/small_text_widget.dart';

class ReservationPage extends StatelessWidget {
  static const String route = '/number/reservation';
  final NumberController numberController;
  final ReservationController reservationController;
  const ReservationPage({
    super.key,
    required this.numberController,
    required this.reservationController,
  });

  @override
  Widget build(BuildContext context) {
    reservationController.getBooking();

    final Booking booking = reservationController.booking;
    final int totalPrice = booking.tourPrice + booking.fuelCharge + booking.serviceCharge;

    final TextEditingController numberPhoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: const MyAppBar(
        text: 'Бронирование',
        pathIcon: 'assets/arrow_back.svg',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MyContainer(
                widget: AnimatedBuilder(
                  animation: reservationController,
                  builder: (BuildContext context, Widget? child) {
                    return BlocHotel(
                      intEstimation: booking.horating,
                      textEstimation: booking.ratingName,
                      nameHotel: booking.hotelName,
                      addressHotel: booking.hotelAdress,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MyContainer(
                widget: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AnimatedBuilder(
                      animation: reservationController,
                      builder: (BuildContext context, Widget? child) {
                        return BlocReservation(
                          nameHotel: booking.hotelName,
                          departure: booking.departure,
                          arrivalCountry: booking.arrivalCountry,
                          tourDateStart: "${booking.tourDateStart.day}.0${booking.tourDateStart.month}.${booking.tourDateStart.year}",
                          tourDateStop: "${booking.tourDateStop.day}.0${booking.tourDateStop.month}.${booking.tourDateStop.year}",
                          numberOfNights: booking.numberOfNights.toString(),
                          room: booking.room,
                          nutrition: booking.nutrition,
                        );
                      },
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MyContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 16.0,
                        left: 16.0,
                        top: 16.0,
                        bottom: 12.0,
                      ),
                      child: BigText(text: 'Информация о покупателе'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                        left: 16.0,
                        bottom: 16.0,
                      ),
                      child: AnimatedBuilder(
                        animation: reservationController,
                        builder: (BuildContext context, Widget? child) {
                          return Column(
                            children: [
                              InputText(
                                lableText: 'Номер телефона',
                                numberMask: true,
                                controller: numberPhoneController,
                                //что б увидел
                                //
                                // как засунуть валидатор ,Ю,Ю,!!!!!!!!!!!???????????????
                                isValid: reservationController.checkNumberValidator(number: numberPhoneController.text),
                              ),
                              InputText(
                                lableText: 'Почта',
                                controller: emailController,
                                isValid: true,
                              ),
                              const SizedBox(height: 8.0),
                              const SmallText(text: 'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту'),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: reservationController,
              builder: (BuildContext context, Widget? child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: reservationController.tourists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return reservationController.tourists[index];
                  },
                );
              },
            ),
            MyContainer(
              widget: AnimatedBuilder(
                animation: reservationController,
                builder: (BuildContext context, Widget? child) {
                  return AddTourist(
                    text: 'Добавить туриста',
                    function: () {
                      reservationController.addTourist(
                        touristWidget: TouristWidget(
                          listAtributes: reservationController.listAtributes,
                          countTourist: 'Новый турист',
                          controller: TextEditingController(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
            MyContainer(
              widget: AnimatedBuilder(
                animation: reservationController,
                builder: (BuildContext context, Widget? child) {
                  return Column(
                    children: [
                      RowPrice(
                        priceForIt: 'Тур',
                        price: booking.tourPrice,
                      ),
                      RowPrice(
                        priceForIt: 'Топливный сбор',
                        price: booking.fuelCharge,
                      ),
                      RowPrice(
                        priceForIt: 'Сервисный сбор',
                        price: booking.serviceCharge,
                      ),
                      RowPrice(
                        priceForIt: 'К оплате',
                        price: totalPrice,
                        isBlue: true,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black12)),
                color: Color(0xFFFFFFFF),
              ),
              child: AnimatedBuilder(
                animation: reservationController,
                builder: (BuildContext context, Widget? child) {
                  return BottonButton(
                    text: 'Оплатить $totalPrice ₽',
                    destination: PaidFor(
                      numberController: numberController,
                      reservationController: reservationController,
                    ),
                    function: () => reservationController.createCustomer(number: numberPhoneController.text, email: emailController.text),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
