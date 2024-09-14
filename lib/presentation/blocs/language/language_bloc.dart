import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/presentation/blocs/language/language_event.dart';
import 'package:localization_bloc/presentation/blocs/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial(const Locale('en'))) {
    on<ChangeLanguage>((event, emit) {
      emit(LanguageChanged(event.locale));
    });
  }
}
