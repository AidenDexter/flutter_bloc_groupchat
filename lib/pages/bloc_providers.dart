import 'package:flutter_bloc/flutter_bloc.dart';

import 'register/bloc/register_blocs.dart';
import 'sign_in/bloc/sign_in_blocs.dart';
import 'welcome/bloc/welcome_blocs.dart';

class AppBLocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
