import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:password_manager/pages/database_transfer.dart';
import 'package:password_manager/pages/home_page.dart';
import 'package:password_manager/pages/login_page.dart';
import 'package:password_manager/pages/profil_page.dart';
import 'package:password_manager/pages/register_page.dart';
import 'package:password_manager/pages/theme_page.dart';

final GoRouter router = GoRouter(
    initialLocation:
        FirebaseAuth.instance.currentUser != null ? "/homePage" : "/loginPage",
    routes: [
      GoRoute(
        path: "/homePage",
        builder: (context, state) =>  HomePage(),
      ),
      GoRoute(
        path: "/loginPage",
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: "/registerPage",
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: "/profilPage",
        builder: (context, state) => ProfilPage(),
      ),
      GoRoute(
        path: "/themePage",
        builder: (context, state) => const ThemePage(),
      ),
      /* GoRoute(
        path: "/databaseTransfer",
        builder: (context, state) => const DatabaseTransfer(),
      ), */
    ]);
