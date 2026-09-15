import 'package:flutter/material.dart';
import '../theme/ploriva_theme.dart';

class HydrationScheduleScreen extends StatelessWidget {
  const HydrationScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule = [
      {'day': 'Today (Wednesday)', 'tasks': 'Water Monstera Deliciosa + Mist Snake Plant'},
      {'day': 'Friday', 'tasks': 'Soil moisture sensor check on Peace Lily'},
      {'day': 'Sunday', 'tasks': 'Fiddle Leaf Fig rotation and watering check'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('7-Day Watering Schedule')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: schedule.length,
        separatorBuilder: (context, _) => const SizedBox(height: 12),
        itemBuilder: (ctx, i) {
          final s = schedule[i];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: PlorivaTheme.surface,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s['day']!, style: const TextStyle(fontWeight: FontWeight.bold, color: PlorivaTheme.mint, fontSize: 15)),
                const SizedBox(height: 6),
                Text(s['tasks']!, style: const TextStyle(fontSize: 13, color: PlorivaTheme.textPrimary)),
              ],
            ),
          );
        },
      ),
    );
  }
}
