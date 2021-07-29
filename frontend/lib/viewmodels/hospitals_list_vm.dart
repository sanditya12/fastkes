import 'package:fastkes_app/services/webservice.dart';
import 'package:flutter/cupertino.dart';

import '../models/hospital.dart';

class HospitalsListViewModel with ChangeNotifier {
  List<HospitalModel> _hospitalsList = [];
  List<HospitalModel> searchResult = [];
  bool isLoading = false;

  List<HospitalModel> get hospitalsList => _hospitalsList;

  int getLength() => _hospitalsList.length;

  void searchList(String keyword) {
    print(keyword);
    print(hospitalsList.length);
    print(searchResult.length);

    List<HospitalModel> placeholderList = [];

    if (keyword.replaceAll(' ', '').length != 0) {
      for (HospitalModel hospital in _hospitalsList) {
        if (hospital.name.toLowerCase().contains(keyword.toLowerCase())) {
          placeholderList.add(hospital);
        }
      }
      searchResult = placeholderList;
      notifyListeners();
    } else {
      placeholderList = [];
    }
  }

  String getName(int index) {
    return _hospitalsList[index].name;
  }

  String getAddress(int index) {
    return _hospitalsList[index].address;
  }

  void populateList() async {
    isLoading = true;
    notifyListeners();
    _hospitalsList = await WebService().getHospitalList();
    isLoading = false;
    notifyListeners();
  }
}
