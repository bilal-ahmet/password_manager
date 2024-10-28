import 'package:go_router/go_router.dart';
import 'package:password_manager/pages/home_page.dart';
import 'package:password_manager/pages/login_page.dart';
import 'package:password_manager/pages/profil_page.dart';
import 'package:password_manager/pages/register_page.dart';
import 'package:password_manager/pages/theme_page.dart';

final GoRouter router = GoRouter(initialLocation: "/homePage", routes: [
  GoRoute(
    path: "/homePage",
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: "/loginPage",
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: "/registerPage",
    builder: (context, state) => const RegisterPage(),
  ),
  GoRoute(
    path: "/profilPage",
    builder: (context, state) => const ProfilPage(),
  ),
  GoRoute(
    path: "/themePage",
    builder: (context, state) => const ThemePage(),
  )
]);
