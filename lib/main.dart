import 'package:flutter/material.dart';
import 'package:localization_bloc/app.dart';
import 'package:localization_bloc/core/services/preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsService = PreferencesService();
  final savedLocale = await prefsService.getLanguage();
  runApp(App(savedLocale: savedLocale));
}
