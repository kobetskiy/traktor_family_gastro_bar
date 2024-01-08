class MealModel {
  final String title;
  final String? subtitle;
  final String? imageURL;
  final String cost;
  final String likesCount;
  final String grams;

  MealModel({
    required this.title,
    required this.cost,
    required this.likesCount,
    required this.grams,
    this.imageURL,
    this.subtitle,
  });
}
