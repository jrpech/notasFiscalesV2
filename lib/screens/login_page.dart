import 'package:flutter/material.dart';
import 'login_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/repositories/user.dart';
import 'package:notas_fiscales/blocs/login/login.dart';
import 'package:notas_fiscales/blocs/authentication/authentication.dart';


class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}