import 'package:fastkes_app/services/map_service.dart';
import 'package:flutter/cupertino.dart';
import '../models/pickup_place.dart';

class PickupInputViewModel with ChangeNotifier {
  List<PickupPlace> _suggestionsList = [];
  bool isLoading = true;

  List<PickupPlace> get suggestionList => _suggestionsList;

  int get listLength => _suggestionsList.length;

  String getAddress(int index) {
    return _suggestionsList[index].address;
  }

  String getLastWord(int index) {
    String address = _suggestionsList[index].address;
    String lastWord = address.split(", ").last;
    return lastWord;
  }

  void getSuggestions(String inputValue) async {
    if (inputValue.isEmpty == false) {
      _suggestionsList = await MapService().getSuggestions(inputValue);
      isLoading = false;

      notifyListeners();
    }
  }
}
