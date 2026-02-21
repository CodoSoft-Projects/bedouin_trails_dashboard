import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../domain/entities/panel_header_entity.dart';

class PanelHeaderItem extends StatelessWidget {
  const PanelHeaderItem({super.key, required this.panelHeaderEntity});
  final PanelHeaderEntity panelHeaderEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: panelHeaderEntity.backgroundColor,
        border: Border.all(color: AppColors.whiteGrey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(panelHeaderEntity.image, height: 24, width: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  panelHeaderEntity.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular18(
                    context,
                  ).copyWith(fontFamily: Constants.vexaFontFamily),
                ),
              ),
            ],
          ),

          Expanded(
            child: Center(
              child: Text(
                panelHeaderEntity.subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.regular48(
                  context,
                ).copyWith(fontFamily: Constants.vexaFontFamily),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
