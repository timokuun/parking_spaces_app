import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  SettingsTile(
      {@required this.title, this.subtitle = "", @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.w),
      title: Text(title, style: Theme.of(context).textTheme.headline3),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: 25.sp,
      ),
      onTap: onTap,
    );
  }
}
