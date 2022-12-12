part of 'auth_bloc.dart';

@immutable
class AuthEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ReadingTokenEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email, password;

  LoginEvent(this.email, this.password);
}

class ShowLogin extends AuthEvent{}

class DefaultHomeEvent extends AuthEvent{}
class LogoutEvent extends AuthEvent {
  final String token;
  LogoutEvent(this.token);
}
