import 'package:fastkes_app/models/pick_hospital.dart';
import 'package:fastkes_app/services/webservice.dart';
import 'package:flutter/cupertino.dart';

class PickHospitalPageViewModel with ChangeNotifier {
  List<PickHospitalModel> _hospitalList = [];
  bool isLoading = true;

  List<PickHospitalModel> get hospitalModel => _hospitalList;

  int get length => _hospitalList.length;

  String getAddress(int index) {
    return _hospitalList[index].hospitalname;
  }

  int getDistance(int index) {
    return _hospitalList[index].distance;
  }

  String getId(int index) {
    return _hospitalList[index].hospitalId;
  }

  void populateList(double lat, double long) async {
    _hospitalList = await WebService().getNearbyHospital(lat, long);

    // print(_hospitalList);
    isLoading = false;
    notifyListeners();
  }
}
