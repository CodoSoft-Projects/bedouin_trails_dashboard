// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class NoTripSection extends StatelessWidget {
  const NoTripSection({super.key, required this.showDesc});
  final bool showDesc;
  
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ===== Illustration Circle =====
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.travel_explore_rounded,
                size: 72,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 28),

            /// ===== Title =====
            Text(
              s.no_trips_title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            /// ===== Description =====
            Visibility(
              visible: showDesc,
              child: Text(
                s.no_trips_description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
