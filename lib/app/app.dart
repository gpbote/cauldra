import 'package:flutter/material.dart';

import '../features/home/character_select_screen.dart';
import 'theme.dart';

class CauldraApp extends StatelessWidget {
  const CauldraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cauldra',
      debugShowCheckedModeBanner: false,
      theme: buildCauldraTheme(),
      home: const CharacterSelectScreen(),
    );
  }
}