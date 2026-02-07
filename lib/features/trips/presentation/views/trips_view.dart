import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class TripsView extends StatelessWidget {
  const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var isMobile = SizeConfig.isMobile();
    return Scaffold(
      floatingActionButton: isMobile ? const _FloatingAction() : null,
      body: const Center(child: Text('Trips View')),
    );
  }
}

class _FloatingAction extends StatelessWidget {
  const _FloatingAction();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add));
  }
}
