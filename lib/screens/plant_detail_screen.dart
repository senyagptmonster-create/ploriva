import 'package:flutter/material.dart';
import '../models/houseplant_item.dart';
import '../painters/water_droplet_painter.dart';
import '../theme/ploriva_theme.dart';

class PlantDetailScreen extends StatelessWidget {
  final HouseplantItem plant;
  final VoidCallback onWater;

  const PlantDetailScreen({
    super.key,
    required this.plant,
    required this.onWater,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(plant.name)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Droplet Moisture Gauge
              Center(
                child: SizedBox(
                  width: 140,
                  height: 180,
                  child: CustomPaint(
                    painter: WaterDropletPainter(hydrationRatio: plant.soilMoisture),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  '${(plant.soilMoisture * 100).toStringAsFixed(0)}% Soil Hydration',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: PlorivaTheme.mint),
                ),
              ),
              const SizedBox(height: 24),

              // Care Specs Card
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: PlorivaTheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _buildSpecRow('Scientific Species', plant.species),
                    const Divider(color: Colors.white10, height: 20),
                    _buildSpecRow('Sunlight Needs', plant.lightNeed),
                    const Divider(color: Colors.white10, height: 20),
                    _buildSpecRow('Water Cadence', 'Every ${plant.wateringIntervalDays} days'),
                    const Divider(color: Colors.white10, height: 20),
                    _buildSpecRow('Last Watered', '${plant.daysSinceWatered} days ago'),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PlorivaTheme.mint,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  onWater();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.water_drop_rounded, size: 24),
                label: const Text('LOG WATERING SESSION', style: TextStyle(fontWeight: FontWeight.w800)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecRow(String label, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white60)),
        Text(val, style: const TextStyle(fontWeight: FontWeight.bold, color: PlorivaTheme.textPrimary)),
      ],
    );
  }
}
