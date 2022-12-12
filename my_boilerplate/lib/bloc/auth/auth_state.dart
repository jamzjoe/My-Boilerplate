part of 'auth_bloc.dart';

bool isLogin = false;

@immutable
class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class InitializeUser extends AuthState {}

class LoginSuccessful extends AuthState {
  final String token;
  final User users;
  final int id;
  final bool isLogin;
  LoginSuccessful(this.token, this.id, this.users, this.isLogin);
}

class ShowLoginPopUp extends AuthState {}

class LoginFailed extends AuthState {
  final String message;

  LoginFailed(this.message);
}

class ReadingTokenError extends AuthState{}

class LoadingData extends AuthState {}

class DefaultHome extends AuthState {}

class LogoutSuccessful extends AuthState {
  final String message;

  LogoutSuccessful(this.message);
}

class WelcomeBackUser extends AuthState {
  final String name;

  WelcomeBackUser(this.name);
}

class LogoutFailed extends AuthState {
  final String message;

  LogoutFailed(this.message);
}
