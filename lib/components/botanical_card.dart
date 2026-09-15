import 'package:flutter/material.dart';
import '../services/houseplant_service.dart';
import '../theme/ploriva_theme.dart';

class BotanicalCard extends StatelessWidget {
  final PlantEntity plant;
  final VoidCallback onWater;
  final VoidCallback onDelete;

  const BotanicalCard({
    super.key,
    required this.plant,
    required this.onWater,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PlorivaTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: plant.needsWater ? Colors.orange : PlorivaTheme.edge,
          width: plant.needsWater ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: plant.needsWater ? Colors.orange.withAlpha(40) : PlorivaTheme.edge,
            foregroundColor: plant.needsWater ? Colors.deepOrange : PlorivaTheme.accent,
            radius: 24,
            child: Icon(plant.needsWater ? Icons.water_drop_outlined : Icons.yard),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plant.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(plant.species, style: const TextStyle(fontSize: 12, color: PlorivaTheme.inkMuted)),
                const SizedBox(height: 4),
                Text(
                  plant.needsWater
                      ? 'Water needed today!'
                      : 'Next drink in ${plant.daysRemaining} days',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: plant.needsWater ? Colors.deepOrange : PlorivaTheme.accent,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.opacity, color: PlorivaTheme.accent),
            tooltip: 'Log Watering',
            onPressed: onWater,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 20, color: PlorivaTheme.inkMuted),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
