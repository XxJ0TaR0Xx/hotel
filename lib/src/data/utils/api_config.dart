import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

@Singleton()
class ApiConfig {
  static bool get isProdaction => kReleaseMode || dotenv.get('ENVIRONMENT').toLowerCase().startsWith('prod');

  static String get apiUri => dotenv.get('API_URI_DEVELOPER');

  Future<void> load() async {
    await dotenv.load(
      fileName: 'assets/env/.env',
      mergeWith: Platform.environment,
    );

    log('Is prod $isProdaction');
    log('api uri $apiUri');
  }
}
