import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color(0xffCD5D67),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48),
        child: TextField(
          cursorColor: Theme.of(context).primaryColor,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDADADA),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[500]),
            hintText: "Cari rumah sakit",
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            focusColor: Theme.of(context).primaryColor,
            prefixIcon: Icon(Icons.search_sharp, color: Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}
