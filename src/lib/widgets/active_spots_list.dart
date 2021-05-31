import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../size_config.dart';
import '../models/parking_spot.dart';
import '../widgets/active_spots_list_element.dart';

// TODO: Correct the time formating

class ActiveSpotsList extends StatelessWidget {
  ActiveSpotsList({
    @required this.userSpots,
  });

  final List<ParkingSpot> userSpots;

  // TODO: Should maybe change name of variables with this... (calculates current rent time)
  DateTime calcRentTime(DateTime start) {
    final diffHr = start.difference(DateTime.now()).inHours;
    final diffMin = start.difference(DateTime.now()).inMinutes;

    return new DateTime(start.year, start.month, start.day, diffHr, diffMin);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.all(0),
        itemBuilder: (buildContext, index) {
          DateTime timeLeft = calcRentTime(spots[index].startTime);
          final left = DateFormat.Hm().format(timeLeft);
          return ActiveSpotsListElement(
            spot: userSpots[index],
            buildIndex: index,
            timeLeft: left,
            margin: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.075,
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          height: 30,
          indent: 40,
          endIndent: 40,
        ),
        itemCount: userSpots.length,
      ),
    );
  }
}
