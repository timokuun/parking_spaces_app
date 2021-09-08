import 'package:car_park_login/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../providers/providers.dart';
import '../../models/parking_spot_v2.dart';

import '../screens/create_spot.dart';
import './edit_spot_screen.dart';

import '../../theme.dart';

import '../widgets/spotter_listing_element.dart';

class SpotListingsScreen extends StatefulWidget {
  @override
  _SpotListingsScreenState createState() => _SpotListingsScreenState();
}

class _SpotListingsScreenState extends State<SpotListingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initially refresh the list of owned spots
    context.read(userInfoProvider).getOwnedSpots();
  }

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
                ),
              ],
            ),

            // List of Spotter's spots
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return context
                      .read(userInfoProvider.notifier)
                      .getOwnedSpots();
                },

                // Owned Spots looks to UserInfoProvider ownedSpots[]
                child: Consumer(
                  builder: (context, watch, child) {
                    final ownedSpots = watch(userInfoProvider).ownedSpots;

                    return ownedSpots.length > 0
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemBuilder: (context, index) {
                              return SpotterListingElement(
                                spot: ownedSpots[index],
                              );
                            },
                            itemCount: ownedSpots.length,
                          )

                        // No owned spots, with refresh button
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You do not own any spots yet...",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              GeneralButton(
                                  margin: EdgeInsets.symmetric(vertical: 2.h),
                                  buttonLabel: "Refresh",
                                  height: 5.h,
                                  width: 20.w,
                                  onTap: () => context
                                      .read(userInfoProvider.notifier)
                                      .getOwnedSpots())
                            ],
                          );
                  },
                ),
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
                builder: (context) => EditSpotScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
