import 'package:flutter/material.dart';

import 'widgets/users_view_header.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const UsersViewHeader(),
        // const SliverToBoxAdapter(child: SizedBox(height: 12)),
        // const SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }
}
