import 'package:flutter/material.dart';
import 'package:flutter_bloc_groupchat/common/routes/names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset('assets/icons/menu.png'),
        ),
        Text(
          "Profile",
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset(
            'assets/icons/more-vertical.png',
          ),
        ),
      ],
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(
          right: 6.w,
        ),
        alignment: Alignment.bottomRight,
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/account_header.png',
            ),
          ),
        ),
        child: Image(
          width: 25.w,
          height: 25.h,
          image: const AssetImage(
            'assets/icons/edit_3.png',
          ),
        ),
      ),
      Text(
        'Who am I?',
        style: TextStyle(color: AppColors.primaryText, fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

//setting section buttons
var imagesInfo = <String, String>{
  'Settings': 'settings.png',
  'Payment details': 'credit-card.png',
  'Achievements': 'award.png',
  'Loves': 'heart_1.png',
  'Reminders': 'cube.png'
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    'assets/icons/${imagesInfo.values.elementAt(index)}',
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
