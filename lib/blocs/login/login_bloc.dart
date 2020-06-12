import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:notas_fiscales/repositories/user.dart';
import 'package:notas_fiscales/blocs/authentication/authentication.dart';
import 'package:notas_fiscales/blocs/login/login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial(
        validPassword: true,
        validUser: true,
      );

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      bool validUser = this._isUserValid(event.username);
      bool validPassword = this._isPasswordValid(event.password);

      if(validPassword && validUser) {
        yield LoginLoading.fromLoginState(state);

        try {
          final token = await userRepository.authenticate(
            username: event.username,
            password: event.password,
          );

          authenticationBloc.add(LoggedIn(token: token));
          yield LoginInitial(
              validPassword: this._isPasswordValid(event.password),
              validUser: this._isPasswordValid(event.username));
        } catch (error) {
          yield LoginFailure.fromLoginState(error.toString(), state);
        }
      } else {
        yield LoginInitial(
            validPassword: validPassword,
            validUser: validUser,
        );
      }
    }
  }

  bool _isUserValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return password.length > 0;
  }
}
