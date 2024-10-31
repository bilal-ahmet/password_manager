import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/bloc/theme_bloc.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {

    final read = context.read<ThemeBloc>();
    final themeState = context.watch<ThemeBloc>().state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("THEME", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Dark Mode", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            SizedBox(width: MediaQuery.of(context).size.width/9,),
            Switch.adaptive(value: themeState.isDarkTheme, onChanged: (value) {
              read.add(ToggleThemeEvent(value));
            },)
          ],
        ),
      ),
    );
  }
}