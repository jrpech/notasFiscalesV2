import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/authentication/authentication.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<AuthenticationBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state is AuthenticationError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('OCURRIO UN ERROR AL INGRESAR'),
              backgroundColor: Colors.red,
              ),
          );
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {

          if(state is AuthenticationLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is AuthenticationAuthenticated) {
            return Column(
              children: <Widget>[

                //MyShoppingListPage();

                /*RaisedButton(
                    onPressed: () async {
                      BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                    },
                    child: Text('Salir'),
                  ),*/
              ],
            );
          }

          




            return Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'username'),
                    keyboardType: TextInputType.emailAddress,
                    controller: _usernameController,
                    autovalidate: true,
                    validator: (_) {
                      //return state.validUser ? null : 'Invalid Email';
                      },
                    ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                    controller: _passwordController,
                    obscureText: true,
                    autovalidate: true,
                    validator: (_) {
                      //return state.validPassword ? null : 'Invalid Password';
                      },
                    ),
                  RaisedButton(
                    onPressed:
                    state is! AuthenticationLoading ? _onLoginButtonPressed : null,
                    child: Text('Login'),
                  ),
              ],
            ),
          );

        },
      ),
    );
  }
}