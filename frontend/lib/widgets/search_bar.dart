import 'package:fastkes_app/viewmodels/hospitals_list_vm.dart';
import 'package:fastkes_app/viewmodels/pickup_input_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.hintString,
    required this.usage,
  }) : super(key: key);

  final String hintString;
  final String usage;

  @override
  Widget build(BuildContext context) {
    final pickupInputModel = Provider.of<PickupInputViewModel>(context);
    final hospitalListModel = Provider.of<HospitalsListViewModel>(context);

    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color(0xffCD5D67),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48),
        child: TextField(
          //* ON CHANGED
          onChanged: (value) {
            switch (usage) {
              case 'pickup_input':
                pickupInputModel.getSuggestions(value);
                break;

              case 'hospital_input':
                break;

              case 'hospital_list_input':
                hospitalListModel.searchList(value);
                break;
              default:
            }
          },

          // DECOR
          cursorColor: Theme.of(context).primaryColor,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
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
            hintText: hintString,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            focusColor: Theme.of(context).primaryColor,
            prefixIcon: Icon(Icons.search_sharp, color: Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}
