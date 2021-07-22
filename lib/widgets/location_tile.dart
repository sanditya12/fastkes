import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      // minWidth: 0,
      onPressed: () {
        //TODO: Update order vm pickup address
        //TODO: Update page to show wanted location, map, and confirm button
      },
      child: Row(
        children: [
          Icon(
            Icons.place_sharp,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                'Address',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xff636464),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
