import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/blocs/authentication/authentication.dart';
import 'package:notas_fiscales/repositories/user.dart';
import 'package:notas_fiscales/screens/login_form.dart';

class AccountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return AuthenticationBloc(userRepository: RepositoryProvider.of<UserRepository>(context))..add(ValidateLoggedIn());
        },
        child: LoginForm(),
      );
  }
}




/*

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context) {

   var blocA =  BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
        )..add(ValidateLoggedIn());
        });

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext contex, AuthenticationState state) {
          if(state is AuthenticationUninitialized) {
            print("state is AuthenticationUninitialized");
          }

          if(state is AuthenticationUnauthenticated) {

            print("state is AuthenticationUnauthenticated");

            return Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'username'),
                  keyboardType: TextInputType.emailAddress,
                  controller: _usernameController,
                  autovalidate: true,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                  controller: _passwordController,
                  obscureText: true,
                  autovalidate: true,
                ),

                SizedBox(height: 10),

                RaisedButton(
                  color: Colors.blueGrey,
                  onPressed: () async {
                    //await Navigator.pushNamed(context, Routes.web_view, arguments: Constants.urlBaseProductos);
                    BlocProvider.of<AuthenticationBloc>(context)..add(LoginButtonPressed(username: _usernameController.text, password: _passwordController.text));
                    //LoginButtonPressed(username: _usernameController.text, password: _passwordController.text);
                    },
                  child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
                  )
              ],
            ),
          );
          }

          if(state is AuthenticationAuthenticated) {
            return Text("MOSTRAR LISTA DE COMPRAS");
          }

          if(state is AuthenticationLoading) {
            print("SHOUDL SHOW PROGRESS");
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Text("MOSTRAR LISTA DE COMPRAS");

        }
    );

    /*return  BlocListener<AuthenticationBloc, AuthenticationState>(
      bloc: blocB,
      listener: (context, state) {
      },
    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      
      builder: (BuildContext contex, AuthenticationState state) {

          if(state is AuthenticationUninitialized) {
            print("state is AuthenticationUninitialized");
          }

          if(state is AuthenticationUnauthenticated) {

            print("state is AuthenticationUnauthenticated");

            return Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'username'),
                  keyboardType: TextInputType.emailAddress,
                  controller: _usernameController,
                  autovalidate: true,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                  controller: _passwordController,
                  obscureText: true,
                  autovalidate: true,
                ),

                SizedBox(height: 10),

                RaisedButton(
                  color: Colors.blueGrey,
                  onPressed: () async {
                    //await Navigator.pushNamed(context, Routes.web_view, arguments: Constants.urlBaseProductos);
                    BlocProvider.of<AuthenticationBloc>(context)..add(LoginButtonPressed(username: _usernameController.text, password: _passwordController.text));
                    },
                  child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
                  )

              ],
            ),
          );
          }

          if(state is AuthenticationAuthenticated) {
            return Text("MOSTRAR LISTA DE COMPRAS");
          }

          if(state is AuthenticationLoading) {
            print("SHOUDL SHOW PROGRESS");
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Text("MOSTRAR LISTA DE COMPRAS");

        }
    ));*/
  }
}*/