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
      'groupName': 'Lot AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
      'distance': '0.6',
      'numSpots': '25',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.1,
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
                Column(
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
                    SpotsGroup(
                      groupName: 'Pangea',
                      distance: 5.5,
                      numberOfAvailableSpots: 6,
                    ),
                    SpotsGroup(
                      groupName: 'Hopkins',
                      distance: 222.2,
                      numberOfAvailableSpots: 200,
                    ),
                    SpotsGroup(
                      groupName:
                          'Lot AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
                      distance: 0.6,
                      numberOfAvailableSpots: 23,
                    ),
                    SpotsGroup(
                      groupName: 'Glen Mor',
                      distance: 36.6,
                      numberOfAvailableSpots: 6,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
