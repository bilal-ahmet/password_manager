import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/bloc/theme_bloc.dart';
import 'package:password_manager/router/page_router.dart';
import 'package:password_manager/theme/dark_theme.dart';
import 'package:password_manager/theme/light_theme.dart';

void main() {
  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: const MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeBloc>().state;
    return MaterialApp.router(
      routerConfig: router,
      theme: themeState.isDarkTheme ? darkTheme : lightTheme
    );
  }
}
