import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class OtpSent extends AuthState {
  final String phoneNumber;

  const OtpSent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class OtpVerified extends AuthState {
  final String phoneNumber;

  const OtpVerified(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class AuthRegistered extends AuthState {
  final String userId;

  const AuthRegistered(this.userId);

  @override
  List<Object?> get props => [userId];
}

class AuthAuthenticated extends AuthState {
  final String userId;
  final String token;

  const AuthAuthenticated(this.userId, this.token);

  @override
  List<Object?> get props => [userId, token];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthPhoneVerified extends AuthState {
  const AuthPhoneVerified();
}
