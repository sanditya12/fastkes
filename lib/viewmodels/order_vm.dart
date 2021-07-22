import 'package:flutter/cupertino.dart';
import '../models/order.dart';

class OrderViewModel with ChangeNotifier {
  OrderModel _order = OrderModel();

  OrderModel get order => _order;

  void updateCustomerName(String customerName) {
    _order.customerName = customerName;

    notifyListeners();
  }

  void updateHospitalCode(String hospitalCode) {
    _order.hospitalCode = hospitalCode;

    notifyListeners();
  }

  void updateCustomerAddress(String customerAddress) {
    _order.customerAddress = customerAddress;

    notifyListeners();
  }
}
