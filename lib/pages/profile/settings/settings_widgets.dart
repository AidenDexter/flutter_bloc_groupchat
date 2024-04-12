import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildSettingsAppBar() {
  return AppBar(centerTitle: true, title: Text('Settings'));
}

Widget settingLogOutButton(BuildContext context, void Function()? removeUserData) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm logout'),
              content: const Text('Confirm logout'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(onPressed: removeUserData, child: const Text('Confirm')),
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            'assets/icons/log_out.png',
          ),
        ),
      ),
    ),
  );
}
