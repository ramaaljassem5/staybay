// import 'package:sta';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staybay/cubits/locale/locale_state.dart';
import 'package:staybay/cubits/locale/locale_cubit.dart';
import 'package:staybay/cubits/theme/theme_cubit.dart';
import 'package:staybay/cubits/theme/theme_state.dart';
import 'package:staybay/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themestate) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, loctalestate) {
              return MaterialApp(
                builder: (context, child) {
                  return Directionality(
                    textDirection: loctalestate.textDirection,
                    child: child!,
                  );
                },
                theme: ThemeData(
                  primaryColor: Colors.blue,
                  primaryColorDark: Colors.blueGrey,
                  primaryColorLight: Colors.lightBlueAccent,
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: Colors.red,
                  primaryColorDark: Colors.deepPurple,
                  primaryColorLight: Colors.redAccent,
                ),
                themeMode: themestate is DarkModeState
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: Test(),
              );
            },
          );
        },
      ),
    );
  }
}
