import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/use_case/login/user_login_usecases.dart';

import 'user_login_event.dart';
import 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final SaveUserUseCase saveUserUseCase;
  final LoginUserUseCase loginUserUseCase;
  final DeleteUserUseCase deleteUserUseCase;
  final GetAllUsersUseCase getAllUsersUseCase;

  UserLoginBloc({
    required this.saveUserUseCase,
    required this.loginUserUseCase,
    required this.deleteUserUseCase,
    required this.getAllUsersUseCase,
  }) : super(UserLoginInitialState()) {
    // Login event handler
    on<LoginUserEvent>((event, emit) async {
      emit(UserLoginLoadingState());
      try {
        final user = await loginUserUseCase.call(event.email, event.password);
        if (user != null) {
          emit(UserLoginSuccessState());
        } else {
          emit(UserLoginErrorState("Invalid credentials"));
        }
      } catch (error) {
        emit(UserLoginErrorState("Failed to login: ${error.toString()}"));
      }
    });

    // Save user event handler
    on<SaveUserEvent>((event, emit) async {
      emit(UserLoginLoadingState());
      try {
        await saveUserUseCase.call(event.email, event.password);
        emit(UserLoginSavedState("User saved successfully!"));
      } catch (error) {
        emit(UserLoginErrorState("Failed to save user: ${error.toString()}"));
      }
    });

    // Delete user event handler
    on<DeleteUserEvent>((event, emit) async {
      emit(UserLoginLoadingState());
      try {
        await deleteUserUseCase.call(event.email);
        emit(UserLoginDeletedState("User deleted successfully!"));
      } catch (error) {
        emit(UserLoginErrorState("Failed to delete user: ${error.toString()}"));
      }
    });

    // Get all users event handler
    on<GetAllUsersEvent>((event, emit) async {
      emit(UserLoginLoadingState());
      try {
        final users = await getAllUsersUseCase.call();
        emit(UserLoginAllUsersState(users));
      } catch (error) {
        emit(UserLoginErrorState(
            "Failed to retrieve users: ${error.toString()}"));
      }
    });
  }
}
