import 'package:flutter/material.dart';
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

List<String> listAtributes = [
  'Имя',
  'Фамилия',
  'Дата рождения',
  'Гражданство',
  'Номер загранпаспорта',
  'Срок действия загранпаспорта',
];

Map<String, String> mapReservation = {
  'Вылет из': 'Санкт-Петербург',
  'Страна, город': 'Египет, Хургада',
  'Даты': '19.09.2023 – 27.09.2023',
  'Кол-во ночей': '7 ночей',
  'Отель': 'Steigenberger Makadi',
  'Номер': 'Стандартный с видом на бассейн или сад',
  'Питание': 'Все включено',
};

class ReservationPage extends StatefulWidget {
  static const String route = '/number/reservation';
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  List<Widget> tourists = [
    Tourist(
      countTourist: 'Первый турист',
      listAtributes: listAtributes,
    ),
    Tourist(
      countTourist: 'Второй турист',
      listAtributes: listAtributes,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: 'Бронирование',
        pathIcon: 'assets/arrow_back.svg',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: MyContainer(
                widget: BlocHotel(
                  intEstimation: 5,
                  textEstimation: 'Превосходно',
                  nameHotel: 'Steigenberger Makadi',
                  addressHotel: 'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MyContainer(
                widget: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    children: List.generate(
                      mapReservation.keys.length,
                      (index) => BlocReservation(
                        dateDiscription: mapReservation.keys.toList()[index],
                        date: mapReservation.values.toList()[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: MyContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 16.0,
                        left: 16.0,
                        top: 16.0,
                        bottom: 12.0,
                      ),
                      child: BigText(text: 'Информация о покупателе'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 16.0,
                        left: 16.0,
                        bottom: 16.0,
                      ),
                      child: Column(
                        children: [
                          InputText(
                            lableText: 'Номер телефона',
                            numberMask: true,
                          ),
                          InputText(lableText: 'Почта'),
                          SizedBox(height: 8.0),
                          SmallText(text: 'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: tourists.length,
              itemBuilder: (BuildContext context, int index) {
                return tourists[index];
              },
            ),
            MyContainer(
              widget: AddTourist(
                text: 'Добавить туриста',
                function: () {
                  final newTourist = Tourist(
                    countTourist: 'Новый турист',
                    listAtributes: listAtributes,
                  );
                  setState(() {
                    tourists.add(newTourist);
                  });
                },
              ),
            ),
            const SizedBox(height: 8.0),
            const MyContainer(
              widget: Column(
                children: [
                  RowPrice(
                    priceForIt: 'Тур',
                    price: '186 600',
                  ),
                  RowPrice(
                    priceForIt: 'Топливный сбор',
                    price: '9 300',
                  ),
                  RowPrice(
                    priceForIt: 'Сервисный сбор',
                    price: '2 136',
                  ),
                  RowPrice(
                    priceForIt: 'К оплате',
                    price: '198 036',
                    isBlue: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black12)),
                color: Color(0xFFFFFFFF),
              ),
              child: const BottonButton(
                text: 'Оплатить 198 036 ₽',
                destination: PaidFor(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
