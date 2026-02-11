import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_person_card.dart';
import '../user_request_details_view.dart';

class RequestUsersGridView extends StatelessWidget {
  const RequestUsersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var crossAxisCount = (width / 210).toInt();
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: max(crossAxisCount, 1),
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 221 / 386,
              mainAxisExtent: 386,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return CustomPersonCard(
                name: 'محمد خالد ابن سلمان',
                phone: '+20 0109876543',
                email: 'a7med123@gmail.com',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    UserRequestDetailsView.routeName,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
