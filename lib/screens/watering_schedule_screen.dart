import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/houseplant_service.dart';
import '../theme/ploriva_theme.dart';

class WateringScheduleScreen extends StatelessWidget {
  const WateringScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.watch<HouseplantService>();
    final needy = service.plants.where((p) => p.needsWater).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Hydration Queue')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: PlorivaTheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: PlorivaTheme.edge),
              ),
              child: Column(
                children: [
                  const Text('Pending Moisture Thirst', style: TextStyle(color: PlorivaTheme.inkMuted, fontSize: 13)),
                  const SizedBox(height: 6),
                  Text(
                    '${needy.length} Plants',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: needy.isNotEmpty ? Colors.deepOrange : PlorivaTheme.accent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Action Required', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            Expanded(
              child: needy.isEmpty
                  ? const Center(child: Text('All foliage well hydrated!', style: TextStyle(color: PlorivaTheme.inkMuted)))
                  : ListView.builder(
                      itemCount: needy.length,
                      itemBuilder: (context, idx) {
                        final p = needy[idx];
                        return ListTile(
                          title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(p.species),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: PlorivaTheme.accent, foregroundColor: Colors.white),
                            onPressed: () => service.waterPlant(p.id),
                            child: const Text('Water Now'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
