import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalListTile extends StatelessWidget {
  HospitalListTile({
    Key? key,
    required this.index,
    this.showIcon = true,
    required this.onUserInput,
    required this.hospitalName,
    required this.address,
  }) : super(key: key);

  final int index;
  final bool showIcon;
  final Function onUserInput;
  final String hospitalName;
  final String address;

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
                '$address',
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
