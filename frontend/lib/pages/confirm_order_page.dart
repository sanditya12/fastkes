import 'package:fastkes_app/models/pick_hospital.dart';
import 'package:fastkes_app/viewmodels/confirmation_page_vm.dart';
import 'package:fastkes_app/viewmodels/order_vm.dart';
import 'package:fastkes_app/viewmodels/pick_hospital_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/transparent_appbar.dart';
import '../widgets/input_widget.dart';

class ConfirmOrderPage extends StatelessWidget {
  ConfirmOrderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModelOrder = Provider.of<OrderViewModel>(context);
    final pickHospitalModel = Provider.of<PickHospitalPageViewModel>(context);

    String getPickedHospital() {
      for (PickHospitalModel hospital in pickHospitalModel.hospitalModel) {
        if (hospital.hospitalId == viewModelOrder.order.hospitalCode) {
          return hospital.hospitalname;
        }
      }
      return '';
    }

    return ChangeNotifierProvider<ConfirmationPageViewModel>(
      create: (_) => ConfirmationPageViewModel(),
      child: Scaffold(
        appBar: TransparentAppBar(title: 'Konfirmasi'),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<ConfirmationPageViewModel>(
            builder: (context, confirmationViewModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Lokasi Penjemputan:',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text(
                                viewModelOrder.pickupLocation,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Text(
                                'Rumah Sakit Tujuan:',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text(
                                getPickedHospital(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InputWidget(
                    hintText: 'Nama pengguna',
                    inputIcon: Icons.account_circle_sharp,
                    input: (String input) {
                      confirmationViewModel.updateName(input);
                      print(confirmationViewModel.customerName);
                    },
                  ),
                  InputWidget(
                    //TODO: AUTOFILL PHONE NUMBER TO USER PHONE NUMBER
                    inputType: 'numbers',
                    hintText: 'Nomor telepon',
                    inputIcon: Icons.phone,
                    input: (String input) {
                      confirmationViewModel.updatePhone(input);
                    },
                  ),
                  SizedBox(height: 8),
                  Consumer<OrderViewModel>(
                    builder: (context, orderViewModel, child) {
                      return ElevatedButton(
                        onPressed: () {
                          orderViewModel.updateCustomerName(
                              confirmationViewModel.customerName);

                          orderViewModel.updateCustomerPhone(
                              confirmationViewModel.customerName);

                          print(orderViewModel.customerName);
                          print(orderViewModel.hospitalCode);

                          orderViewModel.addOrder();

                          //TODO: Popup after confirming order
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
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
                          // shape: StadiumBorder(),
                          primary: Theme.of(context).primaryColor,
                          minimumSize: Size(double.infinity, 30),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
