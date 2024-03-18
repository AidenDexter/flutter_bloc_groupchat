import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_groupchat/common/values/colors.dart';
import 'package:flutter_bloc_groupchat/pages/application/bloc/bloc/app_blocs.dart';
import 'package:flutter_bloc_groupchat/pages/application/bloc/bloc/app_events.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ],
                ),
                width: 375.w,
                height: 58.h,
                child: BottomNavigationBar(
                    currentIndex: state.index,
                    onTap: (value) {
                      context.read<AppBloc>().add(TriggerAppEvent(value));
                    },
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourthElementText,
                    items: bottomTabs),
              ),
            ),
          ),
        );
      },
    );
  }
}
