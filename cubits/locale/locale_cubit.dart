import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  void toEN() async {
    final String responseEN = await rootBundle.loadString(
      'assets/locales/EN.json',
    );
    final Map<String, dynamic> en = jsonDecode(responseEN);
    emit(LocaleEN(local: en));
  }

  void toAR() async {
    final String responseAR = await rootBundle.loadString(
      'assets/locales/AR.json',
    );
    final Map<String, dynamic> ar = jsonDecode(responseAR);
    emit(LocaleAR(local: ar));
  }
}
