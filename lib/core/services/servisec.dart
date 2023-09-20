import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'servisec.config.dart';

final GetIt servisec = GetIt.I;

@InjectableInit(initializerName: 'generate')
FutureOr<void> initServices() {
  servisec.generate();
}
