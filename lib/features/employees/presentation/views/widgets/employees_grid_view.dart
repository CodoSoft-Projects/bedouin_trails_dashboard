import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/account_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_person_card.dart';
import '../../../../../core/widgets/empty_grid_widget.dart';
import '../../manager/employees_provider.dart';
import '../employee_details_view.dart';

class EmployeesGridView extends StatelessWidget {
  const EmployeesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    List<AccountModel> employees = prov.checkGettingEmployees == null
        ? List.generate(6, (index) => AccountModel.empty())
        : prov.employees;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var crossAxisCount = (width / 210).toInt();
          return employees.isEmpty
              ? EmptyGridWidget(
                  message: "لا يوجد موظفين",
                  lottie: Assets.animationsEmptyGrid2,
                )
              : Skeletonizer(
                  enabled: prov.checkGettingEmployees == null,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: max(crossAxisCount, 1),
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 221 / 386,
                      mainAxisExtent: 386,
                    ),
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      var employee = employees[index];
                      return CustomPersonCard(
                        name: employee.fullName,
                        phone: employee.phone,
                        email: employee.email,
                        imgUrl: employee.image,
                        onTap: () {
                          prov
                            ..clearEmployeeData()
                            ..selectEmployee(employee);
                          Navigator.of(
                            context,
                          ).pushNamed(EmployeeDetailsView.routeName);
                        },
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
