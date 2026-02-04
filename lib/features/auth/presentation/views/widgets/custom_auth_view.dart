import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size_config.dart';
import 'auth_app_bar.dart';
import 'custom_auth_view_image_section.dart';

class CustomAuthView extends StatelessWidget {
  const CustomAuthView({
    super.key,
    required this.image,
    required this.showBackIcon,
    required this.note,
    this.showHand = false,
    required this.title,
    required this.subtitle,
    required this.form,
  });

  final String image;
  final bool showBackIcon;
  final String note;
  final String title, subtitle;
  final bool showHand;
  final Widget form;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var isDesktop = SizeConfig.isDesktop();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: [
            if (isDesktop) ...[
              Expanded(
                flex: 3,
                child: CustomAuthViewImageSection(
                  image: image,
                  showBackIcon: showBackIcon,
                  note: note,
                ),
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  AuthAppBar(showBackIcon: showBackIcon),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      // color: Colors.amber,
                      // padding: EdgeInsets.symmetric(horizontal: 32),
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: CustomAuthViewTitle(
                              title: title,
                              showHand: showHand,
                              subtitle: subtitle,
                            ),
                          ),
                          SliverToBoxAdapter(child: SizedBox(height: 32.0)),
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.width * 0.02,
                              ),
                              child: form,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAuthViewTitle extends StatelessWidget {
  const CustomAuthViewTitle({
    super.key,
    required this.title,
    required this.showHand,
    required this.subtitle,
  });

  final String title;
  final bool showHand;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.bold32(context),
              ),
            ),
            if (showHand) ...[
              // SizedBox(width: 4.0),
              Image.asset(Assets.animationsHandGif, height: 30, width: 30),
            ],
          ],
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.regular24(context),
        ),
      ],
    );
  }
}
