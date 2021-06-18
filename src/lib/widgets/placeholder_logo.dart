import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const PlaceholderImage({
    Key key,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
      margin: margin,
      height: 200,
      width: 200,
      child: Center(
        child: Text("IMAGE GOES HERE"),
      ),
    );
  }
}
