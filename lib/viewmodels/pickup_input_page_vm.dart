import 'package:flutter/cupertino.dart';

class PickUpInputPageViewModel with ChangeNotifier {
  bool _hasLocation = false;

  void hasLocationToTrue() {
    _hasLocation = true;
    notifyListeners();
  }
}
