import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/config/l10n/app_local.dart';
import 'package:localization_bloc/core/services/preferences_service.dart';
import 'package:localization_bloc/presentation/blocs/language/language_bloc.dart';
import 'package:localization_bloc/presentation/blocs/language/language_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.loc.appName),
      ),
      body: Column(
        children: [
          Center(child: Text(AppLocal.loc.message)),
          ElevatedButton(
            onPressed: () async {
              chooseLanguage(context, 'en');
            },
            child: const Text('English'),
          ),
          ElevatedButton(
            onPressed: () async {
              chooseLanguage(context, 'ar');
            },
            child: const Text('العربية'),
          ),
          ElevatedButton(
            onPressed: () async {
              chooseLanguage(context, 'fr');
            },
            child: const Text('Franch'),
          ),
        ],
      ),
    );
  }
}

void chooseLanguage(BuildContext context, String languageCode) async {
  final locale = Locale(languageCode);
  BlocProvider.of<LanguageBloc>(context).add(ChangeLanguage(locale));
  final prefsService = PreferencesService();
  await prefsService.setLanguage(locale);
}
