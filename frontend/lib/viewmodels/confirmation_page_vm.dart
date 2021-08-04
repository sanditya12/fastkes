import 'package:flutter/cupertino.dart';

class ConfirmationPageViewModel with ChangeNotifier {
  String customerName;
  String customerPhone;

  ConfirmationPageViewModel({
    this.customerName = '',
    this.customerPhone = '',
  });

  void updateName(String newValue) {
    customerName = newValue;
  }

  void updatePhone(String newValue) {
    customerPhone = newValue;
  }
}
