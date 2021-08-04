import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FastkesLogo extends StatelessWidget {
  const FastkesLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'FAST',
          style: GoogleFonts.montserrat(
            color: Color(0xff46161A),
            textStyle: TextStyle(
              fontSize: 56,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          'KES',
          style: GoogleFonts.montserrat(
            color: Color(0xffCD5D67),
            textStyle: TextStyle(
                fontSize: 56,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w200),
          ),
        ),
      ],
    );
  }
}
