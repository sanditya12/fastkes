import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/pickup_page');
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.phone_in_talk_sharp,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
            SizedBox(width: 8),
            Text(
              'PESAN AMBULANS',
              style: GoogleFonts.montserrat(
                color: Color(0xff46161A),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: Color(0xffF7FAF9),
      ),
    );
  }
}
