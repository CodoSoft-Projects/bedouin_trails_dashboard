import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_pagination.dart';
import '../manager/employees_provider.dart';
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
        const SliverFillRemaining(
          hasScrollBody: false,
          child: SizedBox(height: 12),
        ),
        const _Pagination(),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    return SliverToBoxAdapter(
      child: prov.checkGettingEmployees == false || prov.employees.isEmpty
          ? SizedBox()
          : CustomPagination(
              currentPage: prov.pagination.currentPage,
              totalPages: prov.pagination.lastPage,
              onPageChanged: (page) {
                prov.getAllEmployees(page: page);
              },
            ),
    );
  }
}
