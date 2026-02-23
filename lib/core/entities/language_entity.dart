import '../utils/assets.dart';

class LanguageEntity {
  final String name;
  final String code;
  final String flagSvg;

  LanguageEntity({
    required this.name,
    required this.code,
    required this.flagSvg,
  });
}

List<LanguageEntity> languages = [
  LanguageEntity(
    name: "العربية / Arabic",
    code: 'ar',
    flagSvg: Assets.imagesEg,
  ),
  LanguageEntity(
    name: "English / الإنجليزية",
    code: 'en',
    flagSvg: Assets.imagesUs,
  ),
];
