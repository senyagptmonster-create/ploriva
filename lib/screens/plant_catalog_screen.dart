import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/houseplant_service.dart';
import '../components/botanical_card.dart';
import '../theme/ploriva_theme.dart';

class PlantCatalogScreen extends StatelessWidget {
  const PlantCatalogScreen({super.key});

  void _showAddDialog(BuildContext context) {
    final nameCtrl = TextEditingController();
    final specCtrl = TextEditingController();
    int interval = 7;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: PlorivaTheme.surface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModal) => Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add Garden Plant', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 12),
              TextField(controller: nameCtrl, decoration: const InputDecoration(hintText: 'Plant Nickname (e.g. Monty)', border: OutlineInputBorder())),
              const SizedBox(height: 12),
              TextField(controller: specCtrl, decoration: const InputDecoration(hintText: 'Species (e.g. Ficus)', border: OutlineInputBorder())),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Watering Cadence:'),
                  DropdownButton<int>(
                    value: interval,
                    items: [3, 5, 7, 10, 14, 21].map((d) => DropdownMenuItem(value: d, child: Text('Every $d days'))).toList(),
                    onChanged: (v) { if (v != null) setModal(() => interval = v); },
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: PlorivaTheme.accent, foregroundColor: Colors.white),
                  onPressed: () {
                    if (nameCtrl.text.trim().isNotEmpty) {
                      context.read<HouseplantService>().addPlant(nameCtrl.text.trim(), specCtrl.text.trim(), interval);
                      Navigator.pop(ctx);
                    }
                  },
                  child: const Text('Add Plant'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final service = context.watch<HouseplantService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Botanical Garden')),
      body: service.plants.isEmpty
          ? const Center(child: Text('No houseplants added', style: TextStyle(color: PlorivaTheme.inkMuted)))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: service.plants.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, idx) {
                final p = service.plants[idx];
                return BotanicalCard(
                  plant: p,
                  onWater: () => service.waterPlant(p.id),
                  onDelete: () => service.deletePlant(p.id),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: PlorivaTheme.accent,
        foregroundColor: Colors.white,
        onPressed: () => _showAddDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('New Plant'),
      ),
    );
  }
}
