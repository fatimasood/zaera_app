import 'package:flutter/material.dart';

class SplitViewModel extends ChangeNotifier {
  double _totalAmount = 0;
  int _selectedIndex = 0;
  List<String> selectedMembers = [];

  int get selectedIndex => _selectedIndex;
  double get totalAmount => _totalAmount;
  int get numberOfMembers => selectedMembers.length;

  set totalAmount(double value) {
    _totalAmount = value;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setSelectedMembers(List<String> members) {
    selectedMembers = members;
    notifyListeners();
  }

  double get amountPerPerson {
    if (selectedMembers.isEmpty || _totalAmount == 0) return 0;
    return _totalAmount / selectedMembers.length;
  }
}
