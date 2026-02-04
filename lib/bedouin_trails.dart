import 'package:flutter/material.dart';

class BedouinTrails extends StatelessWidget {
  const BedouinTrails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Bedouin Trails', home: _TestPage());
  }
}

class _TestPage extends StatelessWidget {
  const _TestPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bedouin Trails')),
      body: const Center(child: Text('Welcome to Bedouin Trails!')),
    );
  }
}
