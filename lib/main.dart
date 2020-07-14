import 'package:notas_fiscales/blocs/authentication/authentication.dart';
import 'package:notas_fiscales/blocs/simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notas_fiscales/repositories/books.dart';
import 'package:notas_fiscales/repositories/magazines.dart';
import 'package:notas_fiscales/repositories/repository.dart';

import 'repositories/user.dart';
import 'routes.dart';

void main() {
  //BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider<PostsRepository>(
          create: (context) => PostsRepository(),
        ),
        RepositoryProvider<BooksRepository>(
          create: (context) => BooksRepository(),
        ),
        RepositoryProvider<MagazinesRepository>(
          create: (context) => MagazinesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc(
                  userRepository:
                      RepositoryProvider.of<UserRepository>(context))
                ..add(AppStarted());
            },
          ),
        ],
        child: App(),
      )));
}

/*class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.getRoute
    );
  }
}*/

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.getRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
