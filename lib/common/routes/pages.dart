import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';
import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/bloc/app_blocs.dart';
import '../../pages/register/bloc/register_blocs.dart';
import '../../pages/register/register.dart';
import '../../pages/sign_in/bloc/sign_in_blocs.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';
import '../../pages/welcome/welcome.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
    ];
  }

// return blocProviders
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

//a model that covers entire screen as er click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name matching  when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    print('invalid rote name ${settings.name}');
    return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
  }
}

//unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
