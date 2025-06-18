import 'package:flutter/material.dart';

class DrinkModel extends ChangeNotifier {
  int _totalDrinkAmount = 0;
  final int goal = 2000;

  int get total => _totalDrinkAmount;
  int get remaining => (goal - _totalDrinkAmount).clamp(0, goal);

  void add(int amount) {
    if (_totalDrinkAmount + amount <= goal) {
      _totalDrinkAmount += amount;
      notifyListeners(); 
    }
  }
}
