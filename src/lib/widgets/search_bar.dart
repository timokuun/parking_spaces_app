import 'package:flutter/material.dart';

// TODO: Need to pass in function for search results
class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required FocusNode searchNode,
    @required TextEditingController searchController,
  })  : _searchNode = searchNode,
        _searchController = searchController,
        super(key: key);

  final FocusNode _searchNode;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    bool isFocused = _searchNode.hasFocus;
    return TextField(
      cursorColor: Colors.white,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      onTap: () => _searchNode.requestFocus(),
      focusNode: _searchNode,
      obscureText: false,
      controller: _searchController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 10, 40, 10),
        hintText: "Where are you going?",
        hintStyle: TextStyle(
          color: isFocused ? Theme.of(context).primaryColor : Colors.white,
        ),
        filled: true,
        fillColor: Theme.of(context).primaryColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
