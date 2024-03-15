import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_groupchat/pages/sign_in/sign_in_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/sign_in_blocs.dart';
import 'bloc/sign_in_event.dart';
import 'bloc/sign_in_states.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar('Log in'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                      child: reusableText('Or use your email account to login'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Email'),
                          SizedBox(height: 5.h),
                          buildTextField('Enter your email address', 'email', 'user', (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          SizedBox(height: 5.h),
                          buildTextField('Enter your password', 'password', 'lock', (value) {
                            context.read<SignInBloc>().add(PasswordEvent(value));
                          })
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLogInAdnRegButton('Log in', 'login', () {
                      SignInController(context: context).handleSignIn('email');
                    }),
                    buildLogInAdnRegButton('Sign up', 'register', () {
                      Navigator.of(context).pushNamed('register');
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
