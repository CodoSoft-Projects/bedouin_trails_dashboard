import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/utils/constants.dart';

class HalfCircleProgress extends StatefulWidget {
  final double value; // 0 → 100
  final Color activeColor;
  final Color inactiveColor;
  final double width; // responsive width

  const HalfCircleProgress({
    super.key,
    required this.value,
    required this.activeColor,
    this.inactiveColor = AppColors.chartGrey,
    required this.width,
  });

  @override
  State<HalfCircleProgress> createState() => _HalfCircleProgressState();
}

class _HalfCircleProgressState extends State<HalfCircleProgress>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.value.clamp(0, 100) / 100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.width / 2;

    return FittedBox(
      fit: BoxFit.contain,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, _) {
          return SizedBox(
            width: widget.width,
            height: height,
            child: CustomPaint(
              painter: _HalfCirclePainter(
                progress: _animation.value,
                activeColor: widget.activeColor,
                inactiveColor: widget.inactiveColor,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "${(_animation.value * 100).toInt()}%",
                    style: AppTextStyles.regular24(
                      context,
                    ).copyWith(fontFamily: Constants.vexaFontFamily),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HalfCirclePainter extends CustomPainter {
  final double progress;
  final Color activeColor;
  final Color inactiveColor;

  _HalfCirclePainter({
    required this.progress,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final strokeWidth = 18.0;

    final backgroundPaint = Paint()
      ..color = inactiveColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = activeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      backgroundPaint,
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _HalfCirclePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor;
  }
}
