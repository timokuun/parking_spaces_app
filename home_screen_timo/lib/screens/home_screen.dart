import 'package:flutter/material.dart';
import 'package:home_screen/widgets/draggable_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          // Draggable card
          DraggableSection(),
        ],
      ),
    );
  }
}
