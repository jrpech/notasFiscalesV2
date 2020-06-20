import 'package:notas_fiscales/blocs/authentication/authentication.dart';
import 'package:notas_fiscales/blocs/tab/tab.dart';
import 'package:notas_fiscales/screens/home.dart';
import 'package:notas_fiscales/screens/login_page.dart';
import 'package:notas_fiscales/screens/splash_page.dart';
import 'package:notas_fiscales/screens/web_page.dart';
import 'package:notas_fiscales/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/user.dart';

class Routes {
  static const root = "/";
  static const home = "/home";
  static const web_view = "/webview";

  static MaterialPageRoute getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.web_view:
        return MaterialPageRoute(
            builder: (_) => WebViewContainer("https://notasfiscales.com.mx/producto/actualizacion-fiscal-2020/"), 
            settings: settings);
      break;
      case Routes.root:
        return MaterialPageRoute(
            builder: (_) =>
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                  if (state is AuthenticationUninitialized) {
                    return SplashPage();
                  }
                  if (state is AuthenticationAuthenticated) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<TabBloc>(
                          create: (context) => TabBloc(),
                        ),
                      ],
                      child: HomePage(),
                    );
                  }
                  if (state is AuthenticationUnauthenticated) {
                    final userRepository = UserRepository();
                    return LoginPage(userRepository: userRepository);
                  }
                  return LoadingIndicator();
                }));
    }
  }
}
