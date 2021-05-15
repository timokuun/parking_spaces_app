import 'package:flutter/material.dart';

// TODO: Need to pass in function for search results
class SearchBar extends StatelessWidget {
  final double customWidth;
  final double customHeight;
  final EdgeInsetsGeometry customMargin;

  const SearchBar({
    Key key,
    @required FocusNode searchNode,
    @required TextEditingController searchController,
    @required double customWidth,
    @required double customHeight,
    @required EdgeInsetsGeometry customMargin,
  })  : _searchNode = searchNode,
        _searchController = searchController,
        customWidth = customWidth,
        customHeight = customHeight,
        customMargin = customMargin,
        super(key: key);

  final FocusNode _searchNode;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    bool isFocused = _searchNode.hasFocus;
    return Container(
      width: customWidth,
      height: customHeight,
      margin: customMargin,
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
                color:
                    isFocused ? Theme.of(context).primaryColor : Colors.white,
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
    );
  }
}
