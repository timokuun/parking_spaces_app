import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/parkingSpot.dart';

// TODO: Correct the time formating

class SpotsList extends StatelessWidget {
  final List<ParkingSpot> spots = [
    ParkingSpot(
      spaceID: "A1",
      name: "UCSD Hopkins L1S23",
      address: "Voigt Dr, La Jolla, CA",
      price: 3,
      available: true,
      latitude: 263.2,
      longitude: 100.5,
      startTime: DateTime(2021, 4, 23, 16, 45),
    ),
    ParkingSpot(
      spaceID: "A2",
      name: "UCSD Hopkins L1S19",
      address: "Voigt Dr, La Jolla, CA",
      price: 3,
      available: true,
      latitude: 263.2,
      longitude: 100.5,
      startTime: DateTime(2021, 4, 23, 16, 50),
    ),
    ParkingSpot(
      spaceID: "A3",
      name: "UCSD Hopkins L1S04",
      address: "Voigt Dr, La Jolla, CA",
      price: 3,
      available: true,
      latitude: 263.2,
      longitude: 100.5,
      startTime: DateTime(2021, 4, 23, 16, 53),
    ),
    ParkingSpot(
      spaceID: "A4",
      name: "UCSD Hopkins L1S07",
      address: "Voigt Dr, La Jolla, CA",
      price: 3,
      available: true,
      latitude: 263.2,
      longitude: 100.5,
      startTime: DateTime(2021, 4, 23, 16, 55),
    ),
    ParkingSpot(
      spaceID: "A5",
      name: "UCSD Hopkins L1S09",
      address: "Voigt Dr, La Jolla, CA",
      price: 3,
      available: true,
      latitude: 263.2,
      longitude: 100.5,
      startTime: DateTime(2021, 4, 23, 16, 57),
    ),
    ParkingSpot(
      spaceID: "A6",
      name: "UCSD Hopkins L1S11",
      address: "Voigt Dr, La Jolla, CA",
      price: 3,
      available: true,
      latitude: 263.2,
      longitude: 100.5,
      startTime: DateTime(2021, 4, 23, 16, 59),
    ),
    ParkingSpot(
      spaceID: "A7",
      name: "UCSD Hopkins L1S12",
      address: "Voigt Dr, La Jolla, CA",
      price: 3,
      available: true,
      latitude: 263.2,
      longitude: 100.5,
      startTime: DateTime(2021, 4, 23, 17, 01),
    ),
  ];

  SpotsList();

  DateTime calcRentTime(DateTime start) {
    final diffHr = start.difference(DateTime.now()).inHours;
    final diffMin = start.difference(DateTime.now()).inMinutes;

    return new DateTime(start.year, start.month, start.day, diffHr, diffMin);
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        itemBuilder: (buildContext, index) {
          DateTime timeLeft = calcRentTime(spots[index].startTime);
          final left = DateFormat.Hm().format(timeLeft);
          return Container(
            margin: EdgeInsets.fromLTRB(
                deviceWidth * 0.08, 0, deviceWidth * 0.08, 0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: ListTile(
              tileColor: Colors.black,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text(
                      "${index}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              title: Text(
                "${spots[index].name}",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Rent Time: ${left}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        itemCount: spots.length,
      ),
    );
  }
}
