import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:password_manager/lokal_storage/service.dart';
import 'package:password_manager/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Service service;

  UserBloc(this.service) : super(const UserState()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(const UserState(isLoading: true));
      try {
        final users = await service.getAllUser();
        emit(UserState(users: users));
      } catch (e) {
        emit(UserState(errorMessage: e.toString()));
      }
    });

    on<AddUserEvent>((event, emit) async {
      try {
        await service.addUser(event.user);
        final updateUsers = await service.getAllUser();
        emit(UserState(users: updateUsers));
      } catch (e) {
        emit(UserState(users: state.users, errorMessage: e.toString()));
      }
    });

    on<DeleteUserEvent>((event, emit) async {
      try {
        await service.deleteUser(event.index);
        final updateUsers = List<UserModel>.from(state.users)
          ..removeAt(event.index);
        emit(UserState(users: updateUsers));
      } catch (e) {
        emit(UserState(users: state.users, errorMessage: e.toString()));
      }
    });
  }
}
