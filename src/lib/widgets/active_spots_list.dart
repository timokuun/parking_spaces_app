import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/parking_spot.dart';
import '../widgets/active_spots_list_element.dart';

// TODO: Correct the time formating

class ActiveSpotsList extends StatelessWidget {
  ActiveSpotsList();

  DateTime calcRentTime(DateTime start) {
    final diffHr = start.difference(DateTime.now()).inHours;
    final diffMin = start.difference(DateTime.now()).inMinutes;

    return new DateTime(start.year, start.month, start.day, diffHr, diffMin);
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.all(0),
        itemBuilder: (buildContext, index) {
          DateTime timeLeft = calcRentTime(spots[index].startTime);
          final left = DateFormat.Hm().format(timeLeft);
          return ActiveSpotsListElement(
            margin: EdgeInsets.only(
              left: deviceWidth * 0.075,
            ),
            buildIndex: index,
            timeLeft: left,
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          height: 30,
          indent: 45,
          endIndent: 45,
        ),
        itemCount: spots.length,
      ),
    );
  }
}
