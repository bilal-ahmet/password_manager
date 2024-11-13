import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String appName;

  @HiveField(4)
  final bool isDarkTheme;

  @HiveField(5)
  final bool isSignIn;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.appName,
      required this.isDarkTheme,
      required this.isSignIn});
}
