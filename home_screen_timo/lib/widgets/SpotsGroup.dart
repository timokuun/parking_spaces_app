import 'package:flutter/material.dart';

class SpotsGroup extends StatelessWidget {
  final String groupName;
  final double distance;
  final int numberOfAvailableSpots;

  SpotsGroup({this.groupName, this.distance, this.numberOfAvailableSpots});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 0,
      ),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    "$groupName",
                    style: Theme.of(context).textTheme.headline1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${distance} miles • ${numberOfAvailableSpots} spots",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Text("Box 1"),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Text("Box 2"),
                ),
              ],
            ),
          ],
        ),
        color: Colors.black,
      ),
    );
  }
}
