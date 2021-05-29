import 'package:flutter/material.dart';

import '../theme.dart';

// TODO: Need to pass in function for search results
class SearchBar extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;

  const SearchBar({
    Key key,
    @required FocusNode searchNode,
    @required TextEditingController searchController,
    @required double width,
    @required double height,
    @required EdgeInsetsGeometry margin,
  })  : _searchNode = searchNode,
        _searchController = searchController,
        width = width,
        height = height,
        margin = margin,
        super(key: key);

  final FocusNode _searchNode;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    bool isFocused = _searchNode.hasFocus;
    return Container(
      // TODO: Explain that margin is set here because of the coloring
      margin: margin,
      child: Card(
        elevation: 30.0,
        color: customCyan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Where are you going?",
                  // Hide HintText when typing
                  hintStyle: TextStyle(
                    color: isFocused
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onTap: () => _searchNode.requestFocus(),
                focusNode: _searchNode,
                controller: _searchController,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
