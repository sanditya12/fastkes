import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HospitalTile extends StatelessWidget {
  const HospitalTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
            color: Color(0xff636464),
          ),
        ],
      ),
    );
  }
}
