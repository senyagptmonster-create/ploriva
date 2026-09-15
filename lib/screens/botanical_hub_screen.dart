import 'package:flutter/material.dart';
import '../models/houseplant_item.dart';
import '../theme/ploriva_theme.dart';
import 'hydration_schedule_screen.dart';
import 'plant_detail_screen.dart';

class BotanicalHubScreen extends StatefulWidget {
  const BotanicalHubScreen({super.key});

  @override
  State<BotanicalHubScreen> createState() => _BotanicalHubScreenState();
}

class _BotanicalHubScreenState extends State<BotanicalHubScreen> {
  List<HouseplantItem> _plants = [
    const HouseplantItem(
      id: '1',
      name: 'Monstera Swiss Cheese',
      species: 'Monstera Deliciosa',
      wateringIntervalDays: 7,
      daysSinceWatered: 6,
      lightNeed: 'Bright Indirect Light',
      soilMoisture: 0.25,
    ),
    const HouseplantItem(
      id: '2',
      name: 'Fiddle Leaf Fig',
      species: 'Ficus Lyrata',
      wateringIntervalDays: 10,
      daysSinceWatered: 3,
      lightNeed: 'Direct Morning Sun',
      soilMoisture: 0.72,
    ),
    const HouseplantItem(
      id: '3',
      name: 'Variegated Snake Plant',
      species: 'Sansevieria Trifasciata',
      wateringIntervalDays: 21,
      daysSinceWatered: 14,
      lightNeed: 'Low to High Light',
      soilMoisture: 0.45,
    ),
    const HouseplantItem(
      id: '4',
      name: 'Peace Lily Madonna',
      species: 'Spathiphyllum Wallisii',
      wateringIntervalDays: 5,
      daysSinceWatered: 5,
      lightNeed: 'Partial Shade',
      soilMoisture: 0.15,
    ),
  ];

  void _waterPlant(String id) {
    setState(() {
      _plants = _plants.map((p) {
        if (p.id == id) {
          return p.copyWithResetWatering();
        }
        return p;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final needsWaterCount = _plants.where((p) => p.needsWater).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ploriva Botanical Hub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_rounded),
            tooltip: 'Watering Calendar',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HydrationScheduleScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Care Header Banner
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: PlorivaTheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: PlorivaTheme.mint.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: PlorivaTheme.mint.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.eco_rounded, color: PlorivaTheme.mint, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Botanical Reservoir Active', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: PlorivaTheme.textPrimary)),
                          const SizedBox(height: 2),
                          Text(
                            needsWaterCount > 0 ? '$needsWaterCount plants thirsty today' : 'All plants fully hydrated',
                            style: TextStyle(
                              fontSize: 12,
                              color: needsWaterCount > 0 ? Colors.amberAccent : PlorivaTheme.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'YOUR INDOOR CANOPY',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: PlorivaTheme.textSecondary),
              ),
              const SizedBox(height: 12),

              // Masonry Plant Cards Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: _plants.length,
                itemBuilder: (ctx, i) {
                  final plant = _plants[i];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlantDetailScreen(
                            plant: plant,
                            onWater: () => _waterPlant(plant.id),
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: PlorivaTheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: plant.needsWater ? Colors.amberAccent.withValues(alpha: 0.5) : Colors.white10,
                          width: plant.needsWater ? 1.5 : 1.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.yard_rounded, color: PlorivaTheme.mint, size: 22),
                              if (plant.needsWater)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.amberAccent, borderRadius: BorderRadius.circular(4)),
                                  child: const Text('THIRSTY', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black)),
                                ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(plant.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: PlorivaTheme.textPrimary)),
                              const SizedBox(height: 2),
                              Text(plant.species, style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic, color: Colors.white60)),
                              const SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: plant.soilMoisture,
                                minHeight: 6,
                                backgroundColor: Colors.white10,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  plant.needsWater ? Colors.amberAccent : PlorivaTheme.mint,
                                ),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
