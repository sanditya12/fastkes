import 'package:fastkes_app/services/map_service.dart';
import 'package:fastkes_app/viewmodels/pickup_input_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'confirm_bottom_sheet.dart';

class LocationTile extends StatelessWidget {
  LocationTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<PickupInputViewModel>(
      builder: (context, model, child) {
        return MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 8),
          onPressed: () async {
            List latLong =
                await MapService().getLatLong(model.getAddress(index));

            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ConfirmBottomSheet(
                  address: model.getAddress(index),
                  lat: latLong[0],
                  long: latLong[1],
                );
              },
            );
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
                    model.getAddress(index).substring(0, 28),
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    model.getLastWord(index),
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
      },
    );
  }
}
