import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../utils/app_colors.dart';

class HtmlContentView extends StatelessWidget {
  const HtmlContentView({super.key, required this.html, this.padding});

  final String html;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // 🔥 Arabic support
      child: SingleChildScrollView(
        padding: padding ?? const EdgeInsets.all(16),
        child: Html(data: html, style: _buildStyles(context)),
      ),
    );
  }

  /// 🎯 Centralized styles (clean & scalable)
  Map<String, Style> _buildStyles(BuildContext context) {
    final base = _baseStyle();

    return {
      "body": base,

      /// 📝 Paragraph
      "p": base.copyWith(
        margin: Margins.only(bottom: 12),
        lineHeight: LineHeight.number(1.6),
      ),

      /// 🔠 Headings
      "h1": _heading(28),
      "h2": _heading(24),
      "h3": _heading(20),
      "h4": _heading(18),
      "h5": _heading(16),
      "h6": _heading(14),

      /// 🔗 Links
      "a": base.copyWith(
        color: AppColors.blue,
        textDecoration: TextDecoration.underline,
      ),

      /// 📋 Lists
      "ul": base.copyWith(
        margin: Margins.only(bottom: 12),
        padding: HtmlPaddings.only(left: 16),
      ),
      "ol": base.copyWith(
        margin: Margins.only(bottom: 12),
        padding: HtmlPaddings.only(left: 16),
      ),
      "li": base.copyWith(margin: Margins.only(bottom: 6)),

      /// 💬 Blockquote
      "blockquote": base.copyWith(
        padding: HtmlPaddings.all(12),
        margin: Margins.only(bottom: 12),
        backgroundColor: AppColors.whiteGrey,
        border: Border(left: BorderSide(color: AppColors.sandyBrown, width: 4)),
      ),

      /// 📊 Table
      "table": base.copyWith(
        margin: Margins.only(bottom: 12),
        border: Border.all(color: AppColors.whiteGrey),
      ),
      "th": base.copyWith(
        padding: HtmlPaddings.all(8),
        backgroundColor: AppColors.whiteGrey,
        fontWeight: FontWeight.bold,
      ),
      "td": base.copyWith(
        padding: HtmlPaddings.all(8),
        border: Border.all(color: AppColors.whiteGrey),
      ),
    };
  }

  /// 🔤 Base text style
  Style _baseStyle() {
    return Style(
      margin: Margins.zero,
      padding: HtmlPaddings.zero,
      fontSize: FontSize(16),
      color: AppColors.black,
    );
  }

  /// 🔠 Heading style generator
  Style _heading(double size) {
    return _baseStyle().copyWith(
      fontSize: FontSize(size),
      fontWeight: FontWeight.bold,
      margin: Margins.zero,
    );
  }
}
