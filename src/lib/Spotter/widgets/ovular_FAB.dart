import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OvularFAB extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final String label;

  OvularFAB({this.height, this.width, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.sp),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Theme.of(context).accentColor,
              size: 17.sp,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.headline3.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
        onPressed: () {
          // TODO: Change page to edit mode
          print("Change current page to 'edit mode'");
        },
      ),
    );
  }
}
