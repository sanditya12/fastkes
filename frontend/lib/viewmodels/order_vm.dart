import 'package:fastkes_app/services/webservice.dart';
import 'package:flutter/cupertino.dart';
import '../models/order.dart';

class OrderViewModel with ChangeNotifier {
  OrderModel _order = OrderModel();

  OrderModel get order => _order;

  String get hospitalCode => _order.hospitalCode;
  String get customerName => _order.customerName;
  String get customerNumber => _order.customerAddress;
  String get customerLatLong => _order.customerLatLong;

  String get pickupLocation => _order.customerAddress;

  double getLat() {
    List list = _order.customerLatLong.split(',');
    return double.parse(list[0]);
  }

  double getLong() {
    List list = _order.customerLatLong.split(',');
    return double.parse(list[1]);
  }

  void updateCustomerName(String customerName) {
    _order.customerName = customerName;

    notifyListeners();
  }

  void updateCustomerPhone(String customerPhone) {
    _order.customerNumber = customerPhone;

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

  void updateCustomerLatLong(String customerLatLong) {
    _order.customerLatLong = customerLatLong;

    notifyListeners();
  }

  void addOrder() {
    WebService().addOrder(_order);
    print(hospitalCode);
  }
}
