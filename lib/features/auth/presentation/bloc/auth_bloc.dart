import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<SendOtpEvent>(_onSendOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onSendOtp(
    SendOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(OtpSent(event.phoneNumber));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onVerifyOtp(
    VerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      await Future.delayed(const Duration(seconds: 2));
      final currentState = state;
      if (currentState is OtpSent) {
        emit(OtpVerified(currentState.phoneNumber));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegister(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      if (event.password != event.confirmPassword) {
        emit(const AuthError('Passwords do not match'));
        return;
      }
      if (event.password.length < 8) {
        emit(const AuthError('Password must be at least 8 characters'));
        return;
      }
      await Future.delayed(const Duration(seconds: 2));
      emit(const AuthRegistered('user123'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(const AuthAuthenticated('user123', 'token_xyz'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
