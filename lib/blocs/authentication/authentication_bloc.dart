import 'dart:io';

import 'package:notas_fiscales/repositories/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:notas_fiscales/blocs/authentication/authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  AuthenticationState get initialState => AuthenticationUnauthenticated();

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(null);

  bool _isUserValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return password.length > 0;
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is ValidateLoggedIn) {
      yield AuthenticationLoading();
      bool res = await userRepository.hasToken();

      if (res) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoginButtonPressed) {
      yield AuthenticationLoading();

      bool validUser = this._isUserValid(event.username);
      bool validPassword = this._isPasswordValid(event.password);

      try {
        if (validUser == false) {
          throw ("Usuario no valido");
        }

        if (validPassword == false) {
          throw ("Password no valido");
        }

        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        if (token != null) {
          await userRepository.persistToken(token.id.toString());
          yield AuthenticationAuthenticated();
        } else {
          yield AuthenticationError("Ocurrió un error");
        }
      } catch (error) {
        yield AuthenticationError(error);
      }

      /*bool validUser = this._isUserValid(event.username);
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
      }*/
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
