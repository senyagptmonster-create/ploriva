import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlantEntity {
  final String id;
  final String name;
  final String species;
  final int wateringIntervalDays;
  DateTime lastWatered;

  PlantEntity({
    required this.id,
    required this.name,
    required this.species,
    required this.wateringIntervalDays,
    required this.lastWatered,
  });

  bool get needsWater => DateTime.now().difference(lastWatered).inDays >= wateringIntervalDays;
  int get daysRemaining => wateringIntervalDays - DateTime.now().difference(lastWatered).inDays;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'species': species,
    'wateringIntervalDays': wateringIntervalDays,
    'lastWatered': lastWatered.toIso8601String(),
  };

  factory PlantEntity.fromJson(Map<String, dynamic> m) => PlantEntity(
    id: m['id'] as String,
    name: m['name'] as String,
    species: m['species'] as String,
    wateringIntervalDays: m['wateringIntervalDays'] as int,
    lastWatered: DateTime.parse(m['lastWatered'] as String),
  );
}

class HouseplantService extends ChangeNotifier {
  static const _plantsKey = 'ploriva_plants_v2';

  final List<PlantEntity> _plants = [];

  List<PlantEntity> get plants => List.unmodifiable(_plants);

  HouseplantService() {
    _loadPlants();
  }

  Future<void> _loadPlants() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_plantsKey);
    if (raw != null) {
      final List dec = jsonDecode(raw);
      _plants.clear();
      _plants.addAll(dec.map((e) => PlantEntity.fromJson(e)));
    } else {
      _plants.addAll([
        PlantEntity(
          id: '1',
          name: 'Monstera Deliciosa',
          species: 'Swiss Cheese Plant',
          wateringIntervalDays: 7,
          lastWatered: DateTime.now().subtract(const Duration(days: 4)),
        ),
        PlantEntity(
          id: '2',
          name: 'Fiddle Leaf Fig',
          species: 'Ficus Lyrata',
          wateringIntervalDays: 10,
          lastWatered: DateTime.now().subtract(const Duration(days: 9)),
        ),
        PlantEntity(
          id: '3',
          name: 'Golden Pothos',
          species: 'Epipremnum Aureum',
          wateringIntervalDays: 5,
          lastWatered: DateTime.now().subtract(const Duration(days: 1)),
        ),
      ]);
    }
    notifyListeners();
  }

  void waterPlant(String id) async {
    final idx = _plants.indexWhere((p) => p.id == id);
    if (idx != -1) {
      _plants[idx].lastWatered = DateTime.now();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_plantsKey, jsonEncode(_plants.map((e) => e.toJson()).toList()));
      notifyListeners();
    }
  }

  void addPlant(String name, String species, int days) async {
    final p = PlantEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      species: species,
      wateringIntervalDays: days,
      lastWatered: DateTime.now(),
    );
    _plants.add(p);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_plantsKey, jsonEncode(_plants.map((e) => e.toJson()).toList()));
    notifyListeners();
  }

  void deletePlant(String id) async {
    _plants.removeWhere((p) => p.id == id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_plantsKey, jsonEncode(_plants.map((e) => e.toJson()).toList()));
    notifyListeners();
  }
}
