import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../entities/language_entity.dart';
import '../providers/language_provider.dart';
import '../utils/app_colors.dart';
import 'custom_button.dart';
import 'custom_dialog.dart';
import 'language_button.dart';

Future<dynamic> languagesDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 500,
        title: S.of(context).select_language,
        content: LanguagesForm(),
      );
    },
  );
}

class LanguagesForm extends StatefulWidget {
  const LanguagesForm({super.key});

  @override
  State<LanguagesForm> createState() => _LanguagesFormState();
}

class _LanguagesFormState extends State<LanguagesForm> {
  // bool isArabicLang = true;
  int idx = 0;
  @override
  void initState() {
    super.initState();
    getIdx();
  }

  void getIdx() {
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      String langCode = context.read<LanguageProvider>().langCode;
      // ignore: use_build_context_synchronously
      idx = languages.indexWhere((e) => e.code == langCode);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SizedBox(width: 500),

        ...languages.asMap().entries.map((entry) {
          int index = entry.key;
          LanguageEntity language = entry.value;
          return LanguageButton(
            isSelected: index == idx,
            language: language,
            onTap: () async {
              idx = index;
              setState(() {});
            },
          );
        }),

        const SizedBox(height: 24),
        CustomButton(
          text: S.of(context).change_language,
          horizontalPadding: 64,
          color: AppColors.sandyBrown,
          onPressed: () {
            context.read<LanguageProvider>().changeLanguage(
              languages[idx].code,
            );
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
