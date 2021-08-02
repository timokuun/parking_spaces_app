import 'package:car_park_login/models/parking_spot_v2.dart';
import 'package:flutter/material.dart';

import '../widgets/spot_result.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class UserFavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(top: 4.sp),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          SpotResult(
            spot: spot1V2,
          ),
          SpotResult(
            spot: spot1V2,
          ),
          SpotResult(
            spot: spot1V2,
          ),
          SpotResult(
            spot: spot1V2,
          ),
          SpotResult(
            spot: spot1V2,
          ),
          SpotResult(
            spot: spot1V2,
          ),
          SpotResult(
            spot: spot1V2,
          ),
        ],
      ),
    );
  }
}
