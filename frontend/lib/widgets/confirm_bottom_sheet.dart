import 'package:fastkes_app/viewmodels/order_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmBottomSheet extends StatelessWidget {
  ConfirmBottomSheet({
    Key? key,
    required this.address,
    required this.lat,
    required this.long,
  }) : super(key: key);

  final String address;
  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final model = Provider.of<OrderViewModel>(context);

    return Container(
      height: screenHeight * 1 / 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 0),
            Text(
              '$address',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                //? Update ORDER VM
                model.updateCustomerAddress(address);
                model.updateCustomerLatLong('$lat,$long');

                //? Navigate to choose hospital page
                Navigator.popAndPushNamed(context, '/choose_hospital_page');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Confirm',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                minimumSize: Size(double.infinity, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
