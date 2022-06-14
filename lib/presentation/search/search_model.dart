import 'package:flutter/material.dart';

class SearchModel extends ChangeNotifier {
  String? _searchQuery;

  String? get searchQuery => _searchQuery;

  set searchQuery(String? value) {
    if (value != _searchQuery) {
      _searchQuery = value;
      notifyListeners();
    }
  }

  bool _isMouseOver = false;

  bool get isMouseOver => _isMouseOver;

  set isMouseOver(bool value) {
    if (value != _isMouseOver) {
      _isMouseOver = value;
      notifyListeners();
    }
  }

  bool _hasFocus = false;

  bool get hasFocus => _hasFocus;

  set hasFocus(bool value) {
    if (value != _hasFocus) {
      _hasFocus = value;
      notifyListeners();
    }
  }
}
