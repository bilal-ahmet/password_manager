import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? password;

  @HiveField(3)
  String? appName;

  @HiveField(4)
  String? appMail;

  @HiveField(5)
  String? appPassword;

  UserModel(this.name, this.email, this.password, this.appName, this.appMail, this.appPassword);

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? appName,
    String? appMail,
    String? appPassword,
  }) {
    return UserModel(
      name ?? this.name,
      email ?? this.email,
      password ?? this.password,
      appName ?? this.appName,
      appMail ?? this.appMail,
      appPassword ?? this.appPassword
    );
  }
}
