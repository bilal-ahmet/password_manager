import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? email;

  @HiveField(2)
  final String? password;

  @HiveField(3)
  final String? appName;

  @HiveField(4)
  final bool? isDarkTheme;

  @HiveField(5)
  final bool? isSignIn;

  UserModel(this.name, this.email, this.password, this.appName, this.isDarkTheme, this.isSignIn);

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? appName,
    bool? isDarkTheme,
    bool? isSignIn,
  }) {
    return UserModel(
      name ?? this.name,
      email ?? this.email,
      password ?? this.password,
      appName ?? this.appName,
      isDarkTheme ?? this.isDarkTheme,
      isSignIn ?? this.isSignIn,
    );
  }
}
