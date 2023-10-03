import 'package:flutter/material.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/presentation/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(App());
}
