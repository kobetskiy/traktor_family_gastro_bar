class LanguageModel {
  String language;
  String languageCode;
  LanguageModel({
    required this.language,
    required this.languageCode,
  });
}

List<LanguageModel> get languageModel => [
      LanguageModel(
        language: 'English',
        languageCode: 'en',
      ),
      LanguageModel(
        language: 'Українська',
        languageCode: 'uk',
      ),
    ];
