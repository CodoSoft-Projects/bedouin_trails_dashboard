import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_pagination.dart';
import 'widgets/employees_grid_view.dart';
import 'widgets/employees_view_header.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const EmployeesViewHeader(),
        const SliverToBoxAdapter(child: EmployeesGridView()),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: CustomPagination(
            currentPage: 4,
            totalPages: 100,
            onPageChanged: (page) {
              // here call API again
            },
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }
}
