import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;

  SettingsTile({this.title, this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.w),
      title: Text(
        title,
        // style: TextStyle(fontSize: 18),
        style: TextStyle(fontSize: 12.5.sp),
      ),
      subtitle: Text(
        subtitle,
      ),
      trailing: Icon(
        Icons.chevron_right,
        // size: 35,
        size: 25.sp,
      ),
    );
  }
}
