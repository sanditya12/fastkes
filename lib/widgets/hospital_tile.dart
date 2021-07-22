import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalTile extends StatelessWidget {
  HospitalTile({
    Key? key,
    required this.index,
    this.showIcon = true,
    required this.onUserInput,
  }) : super(key: key);

  final int index;
  final bool showIcon;
  final Function onUserInput;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onUserInput();
      },
      splashColor: Theme.of(context).accentColor,
      hoverColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hospital', //TODO: Replace with model.getName(index)
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Alamat', //TODO: Replace with model.getAddress(index )
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
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
      ),
    );
  }
}
