import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import 'notifications_list_view.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({super.key, this.color});
  final Color? color;

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _toggleOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlay();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  OverlayEntry _createOverlay() {
    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            /// 🔹 Background (tap to dismiss)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleOverlay,
                behavior: HitTestBehavior.opaque,
                child: const SizedBox.expand(),
              ),
            ),

            /// 🔹 Overlay content
            CompositedTransformFollower(
              link: _layerLink,
              // offset: const Offset(-2, 60),
              showWhenUnlinked: false,
              followerAnchor: isArabic()
                  ? Alignment.topRight
                  : Alignment.topLeft,
              targetAnchor: Alignment.bottomRight,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: SizeConfig.width * 0.8,
                  constraints: const BoxConstraints(maxWidth: 350),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderGrey),
                    boxShadow: [
                      BoxShadow(color: AppColors.sandyBrown, blurRadius: 4.0),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'الاشعارات',
                            style: AppTextStyles.regular20(context),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: _toggleOverlay,
                            icon: const Icon(LucideIcons.x),
                          ),
                        ],
                      ),
                      Divider(),
                      NotificationListView(
                        onItemTap: (value) => _toggleOverlay(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: CustomCircularButton(
        icon: LucideIcons.bell,
        showDottedBorder: false,
        borderSide: BorderSide.none,
        backgroundColor: widget.color ?? AppColors.white,
        iconColor: widget.color ?? AppColors.black,
        dottedBorderColor: widget.color ?? AppColors.blue,
        onPressed: _toggleOverlay,
      ),
    );
  }
}
