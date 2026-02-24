import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_search_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trips_provider.dart';

class TripsSearchField extends StatelessWidget {
  const TripsSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: CustomSearchField(
        hintText: S.of(context).searchTrip,
        controller: prov.tripSearchController,
        onChanged: (value) {
          // if (prov.checkGetAllActiveTrips != null || value.isEmpty) {}
          prov.getAllActiveTrips();
        },
      ),
    );
  }
}
