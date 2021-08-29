import 'package:car_park_login/Spotter/screens/edit_spot_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/create_spot.dart';

import '../../theme.dart';

import '../../models/parking_spot_v2.dart';

import '../widgets/spotter_listing_element.dart';

class SpotListingsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        endDrawer: Drawer(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.5.h),
                  child: Text(
                    "Filters",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            // Row of title and button to toggle Filter drawer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                  child: Text(
                    "Today's Spots",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5.w),
                  height: 5.4.h,
                  width: 5.4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2.sp),
                  ),
                  child: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                    icon: Icon(
                      Icons.sort_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),

            // List of Spotter's spots
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  return SpotterListingElement(
                    spot: spotsV2[index],
                  );
                },
                itemCount: spotsV2.length,
              ),
            ),
          ],
        ),

        // Button to create new parking spot
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            color: Theme.of(context).accentColor,
            size: 17.sp,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                // builder: (context) => CreateSpot(),
                builder: (context) => EditSpotScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
