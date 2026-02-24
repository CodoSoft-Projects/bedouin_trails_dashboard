import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_search_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/employees_provider.dart';

class EmployeesSearchField extends StatelessWidget {
  const EmployeesSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: CustomSearchField(
        hintText: S.of(context).search,
        controller: prov.searchController,
        onChanged: (value) {
          prov.getAllEmployees();
        },
      ),
    );
  }
}
