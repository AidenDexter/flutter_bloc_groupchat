import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_groupchat/pages/register/register_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/register_blocs.dart';
import 'bloc/register_events.dart';
import 'bloc/register_states.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar('Sign up'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: reusableText('Enter your details below and free sign up'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('User name'),
                          buildTextField('Enter your user name', 'name', 'user', (value) {
                            context.read<RegisterBloc>().add(UserNameEvent(value));
                          }),
                          reusableText('Email'),
                          buildTextField('Enter your email address', 'email', 'user', (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          buildTextField('Enter your password', 'password', 'lock', (value) {
                            context.read<RegisterBloc>().add(PasswordEvent(value));
                          }),
                          reusableText('Re-enter Password'),
                          buildTextField('Re-enter Password your password to confirm', 'password', 'lock', (value) {
                            context.read<RegisterBloc>().add(RePasswordEvent(value));
                          })
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.h),
                      child: reusableText(
                        'Enter your details below and free sign up',
                      ),
                    ),
                    buildLogInAdnRegButton('Sign up', 'login', () {
                      // Navigator.of(context).pushNamed('register');
                      RegisterController(context: context).handleEmailRegister();
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
