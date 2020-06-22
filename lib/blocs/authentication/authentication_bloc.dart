import 'dart:io';

import 'package:notas_fiscales/repositories/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:notas_fiscales/blocs/authentication/authentication.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  @override
  AuthenticationState get initialState => AuthenticationUnauthenticated();

  AuthenticationBloc({@required this.userRepository}): assert(userRepository != null);

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {

    if(event is ValidateLoggedIn) {
      yield AuthenticationLoading();
      bool res = await userRepository.hasToken();

      if(res){
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoginButtonPressed) {
      yield AuthenticationLoading();
      
      if(event.username == "demo1" && event.password == "1234"){
        await userRepository.persistToken("event.token.23242d3223434dx234d3523f8h9gte7ygyg");
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationError();
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