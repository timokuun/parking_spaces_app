import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class ActiveSpotsNumberIndicator extends ConsumerWidget {
  final EdgeInsetsGeometry margin;

  ActiveSpotsNumberIndicator({this.margin});

  @override
  Widget build(BuildContext context, watch) {
    final activeSpots = watch(userActiveSpotsProvider);
    return Container(
      // padding: EdgeInsets.all(10),
      padding: EdgeInsets.all(7.sp),
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        // borderRadius: BorderRadius.circular(30),
        borderRadius: BorderRadius.circular(30.sp),
      ),
      child: Text(
        "${activeSpots.length} Active Spots",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
