import 'package:flutter/material.dart';
import '../theme/ploriva_theme.dart';

class SoilNutritionScreen extends StatelessWidget {
  const SoilNutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guides = [
      {'title': 'Spring Nitrogen Boost', 'desc': 'Promotes lush green leafy foliage during emerging vegetative shoots.'},
      {'title': 'Root Potassium Fortification', 'desc': 'Enhances stem resilience and cellular water retention.'},
      {'title': 'Substrate Aeration Guide', 'desc': 'Perlite and orchid bark additions prevent fungal root rot from stagnant potting soil.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Substrate & Feeding')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: guides.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, idx) {
          final g = guides[idx];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: PlorivaTheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: PlorivaTheme.edge),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(g['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text(g['desc']!, style: const TextStyle(fontSize: 13, color: PlorivaTheme.inkMuted, height: 1.3)),
              ],
            ),
          );
        },
      ),
    );
  }
}
