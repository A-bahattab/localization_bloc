import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/presentation/blocs/language/language_bloc.dart';
import 'package:localization_bloc/presentation/blocs/language/language_event.dart';
import 'package:localization_bloc/presentation/blocs/language/language_state.dart';
import 'package:localization_bloc/presentation/screens/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  final Locale savedLocale;
  const App({super.key, required this.savedLocale});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageBloc()..add(ChangeLanguage(savedLocale)),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          final locale = state is LanguageChanged ? state.locale : savedLocale;
          return MaterialApp(
            title: 'Localization',
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
