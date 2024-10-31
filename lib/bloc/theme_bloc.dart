import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(isDarkTheme: false)) {
    on<ToggleThemeEvent>((event, emit) {
      emit(ThemeState(isDarkTheme: event.isDarkTheme));
    });
  }
}
