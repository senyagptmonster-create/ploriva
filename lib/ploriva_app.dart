import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/ploriva_theme.dart';
import 'services/houseplant_service.dart';
import 'screens/plant_catalog_screen.dart';
import 'screens/watering_schedule_screen.dart';
import 'screens/soil_nutrition_screen.dart';
import 'screens/garden_settings_screen.dart';

class PlorivaApp extends StatelessWidget {
  const PlorivaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HouseplantService(),
      child: MaterialApp(
        title: 'Ploriva Leaf Garden',
        debugShowCheckedModeBanner: false,
        theme: PlorivaTheme.theme,
        home: const _PlorivaShell(),
      ),
    );
  }
}

class _PlorivaShell extends StatefulWidget {
  const _PlorivaShell();

  @override
  State<_PlorivaShell> createState() => _PlorivaShellState();
}

class _PlorivaShellState extends State<_PlorivaShell> {
  int _idx = 0;

  final List<Widget> _views = const [
    PlantCatalogScreen(),
    WateringScheduleScreen(),
    SoilNutritionScreen(),
    GardenSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _idx, children: _views),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        onDestinationSelected: (i) => setState(() => _idx = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.yard_outlined), label: 'Plants'),
          NavigationDestination(icon: Icon(Icons.water_drop_outlined), label: 'Hydrate'),
          NavigationDestination(icon: Icon(Icons.eco_outlined), label: 'Soil'),
          NavigationDestination(icon: Icon(Icons.tune), label: 'Care'),
        ],
      ),
    );
  }
}
