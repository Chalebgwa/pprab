import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
  int _selectedIndex = 0;
  int _selectedBreadcrumbIndex = 0;

  int get selectedBreadcrumbIndex => _selectedBreadcrumbIndex;

  int get selectedIndex => _selectedIndex;

  void setSelectedBreadcrumbIndex(int index) {
    _selectedBreadcrumbIndex = index;
    notifyListeners();
  }

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
