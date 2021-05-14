import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 0,
      ),
      height: 35,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          TextField(
            textAlign: TextAlign.center,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: "Where are you going?",
              focusedBorder: InputBorder.none,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(
                left: 5,
              ),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
