import 'package:flutter/material.dart';
import 'screens/botanical_hub_screen.dart';
import 'theme/ploriva_theme.dart';

class PlorivaApp extends StatelessWidget {
  const PlorivaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ploriva Botanical Hub',
      debugShowCheckedModeBanner: false,
      theme: PlorivaTheme.themeData,
      home: const BotanicalHubScreen(),
    );
  }
}
