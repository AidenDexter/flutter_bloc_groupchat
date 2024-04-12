import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_groupchat/common/routes/names.dart';
import 'package:flutter_bloc_groupchat/common/values/constant.dart';
import 'package:flutter_bloc_groupchat/global.dart';
import 'package:flutter_bloc_groupchat/pages/application/bloc/app_blocs.dart';
import 'package:flutter_bloc_groupchat/pages/application/bloc/app_events.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/settings_bloc.dart';
import 'bloc/settings_state.dart';
import 'settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSettingsAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
          return Container(
            child: Column(
              children: [
                settingLogOutButton(context, removeUserData),
              ],
            ),
          );
        }),
      ),
    );
  }
}
