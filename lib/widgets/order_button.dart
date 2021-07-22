import 'package:flutter/material.dart';
import '../pages/pickup_input_page.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PickUpInputPage()),
        );
      },
      child: Icon(
        Icons.phone_in_talk_sharp,
        size: 56,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(36),
        primary: Theme.of(context).primaryColor,
        shadowColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
