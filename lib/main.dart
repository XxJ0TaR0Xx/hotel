import 'package:flutter/material.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/data/utils/api_config.dart';
import 'package:hotel/src/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  await ApiConfig().load();

  runApp(const App());
}
