import 'package:flutter/foundation.dart';


class FavouriteItemProvider with ChangeNotifier{
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItem(int itemNumber){
    _selectedItem.add(itemNumber);
    notifyListeners();
  }
  void removeItem(int itemNumber){
    _selectedItem.remove(itemNumber);
    notifyListeners();
  }

}