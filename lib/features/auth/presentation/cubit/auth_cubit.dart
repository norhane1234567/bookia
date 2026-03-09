import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  
  Future<void> login(String email, String password) async {

    emit(AuthLoading());

    try {

      final result = await authRepo.login(email, password);

      emit(AuthSuccess(result));

    } catch (e) {

      emit(AuthError(e.toString()));

    }
  }

 
  Future<void> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {

    emit(AuthLoading());

    try {

      final result = await authRepo.register(
        name,
        email,
        password,
        confirmPassword,
      );

      emit(AuthSuccess(result));

    } catch (e) {

      emit(AuthError(e.toString()));

    }
  }

  
  Future<void> forgotPassword(String email) async {

    emit(AuthLoading());

    try {

      final result = await authRepo.forgotPassword(email);

      emit(AuthSuccess(result));

    } catch (e) {

      emit(AuthError(e.toString()));

    }
  }

  Future<void> verifyOtp(
    String email,
    String otp,
  ) async {

    emit(AuthLoading());

    try {

      final result = await authRepo.verifyOtp(
        email,
        otp,
      );

      emit(AuthSuccess(result));

    } catch (e) {

      emit(AuthError(e.toString()));

    }
  }

  Future<void> resetPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {

    emit(AuthLoading());

    try {

      final result = await authRepo.resetPassword(
        email,
        password,
        confirmPassword,
      );

      emit(AuthSuccess(result));

    } catch (e) {

      emit(AuthError(e.toString()));

    }
  }
}