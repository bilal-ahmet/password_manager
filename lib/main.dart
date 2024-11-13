import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/bloc/theme_bloc.dart';
import 'package:password_manager/model/user_model.dart';
import 'package:password_manager/router/page_router.dart';
import 'package:password_manager/theme/dark_theme.dart';
import 'package:password_manager/theme/light_theme.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

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
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: themeState.isDarkTheme ? darkTheme : lightTheme
    );
  }
}
