import 'package:fastkes_app/pages/hospitals_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fastkes_app/viewmodels/hospitals_list_vm.dart';
import 'package:provider/provider.dart';

class HospitalsButton extends StatelessWidget {
  const HospitalsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final model =
            Provider.of<HospitalsListViewModel>(context, listen: false);
        model.populateList();
        print(model.hospitalsList);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HospitalsPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
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
              'CARI AMBULANS',
              style: GoogleFonts.montserrat(
                color: Color(0xff46161A),
                textStyle: TextStyle(
                  fontSize: 24,
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
