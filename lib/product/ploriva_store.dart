import 'package:flutter/foundation.dart';

class PlorivaStore extends ChangeNotifier {
  List<String> plants = ['Monstera', 'Snake Plant'];

  void addPlant(String name) {
    plants.add(name);
    notifyListeners();
  }
}
