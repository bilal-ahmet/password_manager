part of 'user_bloc.dart';

@immutable
class UserState {
  final List<UserModel> users;
  final bool isLoading;
  final String? errorMessage;

  const UserState({this.users = const [], this.isLoading = false, this.errorMessage});
}

