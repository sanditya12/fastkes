import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget({
    Key? key,
    required this.hintText,
    required this.inputIcon,
    required this.input,
    this.inputType = 'regular',
  }) : super(key: key);

  final String hintText;
  final IconData inputIcon;
  final Function input;
  final String inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onChanged: (value) {
          input(value);
        },
        cursorColor: Theme.of(context).primaryColor,
        style: TextStyle(fontSize: 16),
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
          hintText: hintText,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          focusColor: Theme.of(context).primaryColor,
          prefixIcon: Icon(inputIcon, color: Colors.grey[500]),
        ),
      ),
    );
  }
}
