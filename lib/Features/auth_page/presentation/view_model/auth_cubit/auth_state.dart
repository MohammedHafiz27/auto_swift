part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingSignup extends AuthState {}

class AuthSuccessSignup extends AuthState {}

class AuthFailureSignup extends AuthState {
  final String message;
  AuthFailureSignup(this.message);
}
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
