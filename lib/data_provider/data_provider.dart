import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  bool isBacked = false;
  bool isFavorite = false;

  void changeStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void changeStatusForNowPlaying() {
    isBacked = true;
    notifyListeners();
  }
}
