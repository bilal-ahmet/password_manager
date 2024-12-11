part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class LoadUsersEvent extends UserEvent{}

class AddUserEvent extends UserEvent{
  final UserModel user;

  AddUserEvent(this.user);
}

class DeleteUserEvent extends UserEvent{
  final int index;

  DeleteUserEvent(this.index);
}
