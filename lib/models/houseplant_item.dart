class HouseplantItem {
  final String id;
  final String name;
  final String species;
  final int wateringIntervalDays;
  final int daysSinceWatered;
  final String lightNeed;
  final double soilMoisture; // 0.0 to 1.0

  const HouseplantItem({
    required this.id,
    required this.name,
    required this.species,
    required this.wateringIntervalDays,
    required this.daysSinceWatered,
    required this.lightNeed,
    required this.soilMoisture,
  });

  bool get needsWater => daysSinceWatered >= wateringIntervalDays;

  HouseplantItem copyWithResetWatering() {
    return HouseplantItem(
      id: id,
      name: name,
      species: species,
      wateringIntervalDays: wateringIntervalDays,
      daysSinceWatered: 0,
      lightNeed: lightNeed,
      soilMoisture: 0.95,
    );
  }
}
