import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_boilerplate/models/users.dart';
import 'package:my_boilerplate/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final Future<SharedPreferences> _preferences = SharedPreferences.getInstance();
final AuthRepository _authRepository = AuthRepository();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<ReadingTokenEvent>((event, emit) async {
      emit(AuthInitial());
      emit(LoadingData());
      final SharedPreferences pref;
      try {
        pref = await _preferences;
        final token = pref.getString('token');
        final int? userId = pref.getInt('user_id');
        if (token!.isEmpty) {
          emit(ShowLoginPopUp());
          emit(ReadingTokenError());
        } else {
          final user = await _authRepository.getUser(userId!);
          emit(LoginSuccessful(token.toString(), userId, user, true));
        }
      } catch (e) {
        emit(ReadingTokenError());
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthInitial());
      emit(LoadingData());
      try {
        await _authRepository.logout(event.token);
        emit(LogoutSuccessful('Log out successfully!'));
      } catch (e) {
        emit(LogoutFailed('Logout failed'));
      }
    });

    on<ShowLogin>((event, emit) async {
      emit(AuthInitial());
      emit(ShowLoginPopUp());
    });

    on<DefaultHomeEvent>((event, emit) async {
      emit(AuthInitial());
      emit(DefaultHome());
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthInitial());
      emit(LoadingData());
      try {
        await _authRepository.login(event.email, event.password);
        emit(LoginSuccessful(_authRepository.token, _authRepository.id,
            _authRepository.users, true));
      } catch (e) {
        emit(LoginFailed('Log in failed!'));
      }
    });
  }
}
