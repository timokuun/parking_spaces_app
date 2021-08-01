import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;

  SettingsTile({this.title, this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: 35,
      ),
    );
  }
}
