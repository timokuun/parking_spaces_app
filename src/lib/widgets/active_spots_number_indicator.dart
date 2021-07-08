import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class ActiveSpotsNumberIndicator extends ConsumerWidget {
  final EdgeInsetsGeometry margin;

  ActiveSpotsNumberIndicator({this.margin});

  @override
  Widget build(BuildContext context, watch) {
    final activeSpots = watch(userActiveSpotsProvider);
    return Container(
      padding: EdgeInsets.all(10),
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "${activeSpots.length} Active Spots",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
