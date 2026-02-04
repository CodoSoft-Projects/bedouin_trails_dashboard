import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

class BedouinTrails extends StatelessWidget {
  const BedouinTrails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bedouin Trails',
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: _TestPage(),
    );
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
