import 'package:flutter/material.dart';
import './SpotsGroup.dart';
import './searchbar.dart';

class DraggableSection extends StatefulWidget {
  @override
  _DraggableSectionState createState() => _DraggableSectionState();
}

class _DraggableSectionState extends State<DraggableSection> {
  /* Properties */
  // List of Parking Garages
  final List<Map<String, String>> garages = [
    {
      'groupName': 'Pangea',
      'distance': '5.5',
      'numSpots': '5',
    },
    {
      'groupName': 'Hopkins',
      'distance': '1.2',
      'numSpots': '1',
    },
    {
      'groupName': 'Glen Mor',
      'distance': '30.2',
      'numSpots': '50',
    },
    {
      'groupName': 'Lot A AA AA AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
      'distance': '0.6',
      'numSpots': '25',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.15,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // Draggable indicator
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 0,
                  ),
                  color: Colors.grey,
                  width: 40,
                  height: 3,
                ),
                // Search Bar
                SearchBar(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return SpotsGroup(
                        groupName: garages[index]['groupName'],
                        distance: double.parse(garages[index]['distance']),
                        numberOfAvailableSpots:
                            int.parse(garages[index]['numSpots']),
                      );
                    },
                    itemCount: garages.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
