import 'package:flutter/cupertino.dart';

import '../models/hospital.dart';

class HospitalsListViewModel with ChangeNotifier {
  List<HospitalModel> _hospitalsList = [];
  bool isLoading = false;

  List<HospitalModel> get hospitalsList => _hospitalsList;

  int getLength() => _hospitalsList.length;

  String getName(int index) {
    return _hospitalsList[index].name;
  }

  String getAddress(int index) {
    return _hospitalsList[index].address;
  }

  void populateList() async {
    isLoading = true;
    // _hospitalsList = await WebService().getNewsList();
    isLoading = false;
    notifyListeners();
  }
}
