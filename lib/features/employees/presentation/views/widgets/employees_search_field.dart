import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_search_field.dart';

class EmployeesSearchField extends StatelessWidget {
  const EmployeesSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: CustomSearchField(onChanged: (value) {}),
    );
  }
}
