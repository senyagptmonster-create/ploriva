import 'package:flutter/material.dart';
import '../theme/ploriva_theme.dart';

class GardenSettingsScreen extends StatelessWidget {
  const GardenSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Care Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: PlorivaTheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: PlorivaTheme.edge),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Botanical Microclimate Care', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 8),
                Text(
                  'Indoor houseplants adjust transpiration according to seasonal humidity and light duration. Maintain pebble trays in dry heated rooms.',
                  style: TextStyle(fontSize: 13, color: PlorivaTheme.inkMuted, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
