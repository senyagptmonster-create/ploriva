import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ploriva_store.dart';
import 'screens.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlorivaStore()),
      ],
      child: MaterialApp(
        title: 'Ploriva Garden',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const PlorivaHome(),
      ),
    );
  }
}
