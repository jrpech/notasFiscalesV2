import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState({
    this.validUser,
    this.validPassword,
  });

  final bool validUser;
  final bool validPassword;

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  LoginInitial({
    @required bool validUser,
    @required bool validPassword
  }): super(validUser: validUser, validPassword: validPassword);

  @override
  List<Object> get props => [validUser, validPassword];
}

class LoginLoading extends LoginState {

  LoginLoading({
    @required bool validUser,
    @required bool validPassword
  }): super(validUser: validUser, validPassword: validPassword);

  LoginLoading.fromLoginState(LoginState state):
        super(validPassword: state.validPassword, validUser: state.validUser);

}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({
    @required this.error,
    @required bool validUser,
    @required bool validPassword
  });

  LoginFailure.fromLoginState(this.error, LoginState state):
        super(validPassword: state.validPassword, validUser: state.validUser);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}