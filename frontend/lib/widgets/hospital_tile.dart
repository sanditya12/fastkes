import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalTile extends StatelessWidget {
  HospitalTile({
    Key? key,
    required this.index,
    this.showIcon = true,
    required this.onUserInput,
    this.hospitalName = '',
    this.distance = 0,
  }) : super(key: key);

  final int index;
  final bool showIcon;
  final Function onUserInput;
  final String hospitalName;
  final int distance;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onUserInput();
      },
      splashColor: Theme.of(context).accentColor,
      hoverColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hospitalName.length > 30
                    ? hospitalName.substring(0, 31)
                    : hospitalName,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text(
                '${(distance / 1000).toString()} km',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xff636464),
                  ),
                ),
              ),
            ],
          ),
          Icon(
            Icons.open_in_new_sharp,
            color: showIcon ? Color(0xff636464) : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
