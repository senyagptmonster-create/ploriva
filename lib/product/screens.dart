import 'package:flutter/material.dart';
import '../app/theme.dart';
import '../app/brand.dart';

class PlorivaHome extends StatelessWidget {
  const PlorivaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(
        title: Text('Ploriva Hub', style: AppTheme.display(cAccent)),
        backgroundColor: cSurface,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _HubCard(title: 'Collection', icon: Icons.local_florist, onTap: () => _nav(context, const CollectionScreen())),
          _HubCard(title: 'Schedule', icon: Icons.calendar_today, onTap: () => _nav(context, const ScheduleScreen())),
          _HubCard(title: 'Milestones', icon: Icons.trending_up, onTap: () => _nav(context, const MilestonesScreen())),
          _HubCard(title: 'Encyclopedia', icon: Icons.book, onTap: () => _nav(context, const EncyclopediaScreen())),
        ],
      ),
    );
  }
  
  void _nav(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}

class _HubCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const _HubCard({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: cSurface, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: cAccent),
            const SizedBox(height: 10),
            Text(title, style: AppTheme.text(cInk)),
          ],
        ),
      ),
    );
  }
}

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(title: Text('Collection', style: AppTheme.text(cInk)), backgroundColor: cSurface),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(color: cSurface, child: ListTile(title: Text('Monstera Deliciosa', style: AppTheme.text(cInk)))),
        ],
      ),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(title: Text('Care Schedule', style: AppTheme.text(cInk)), backgroundColor: cSurface),
      body: Center(child: Text('Next Watering: Today', style: AppTheme.text(cInk))),
    );
  }
}

class MilestonesScreen extends StatelessWidget {
  const MilestonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(title: Text('Milestones', style: AppTheme.text(cInk)), backgroundColor: cSurface),
      body: Center(child: Text('New Leaf: Monstera', style: AppTheme.text(cInk))),
    );
  }
}

class EncyclopediaScreen extends StatelessWidget {
  const EncyclopediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(title: Text('Encyclopedia', style: AppTheme.text(cInk)), backgroundColor: cSurface),
      body: Center(child: Text('Plant Care Tips', style: AppTheme.text(cInk))),
    );
  }
}
