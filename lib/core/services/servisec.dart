import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'servisec.config.dart';

final GetIt servisec = GetIt.I;

@InjectableInit(initializerName: 'generate')
FutureOr<void> initServices() {
  servisec.generate();
}

@injectable
class DioModule {
  Dio get clietn => Dio();
}
