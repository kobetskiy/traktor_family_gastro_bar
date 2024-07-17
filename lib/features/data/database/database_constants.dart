abstract class DatabaseCollections {
  static const String mealsCollection = 'meals';
  static const String bannersCollection = 'banners';
  static const String errorsCollection = 'errors';
  static const String reviewsCollection = 'reviews';
  static const String usersCollection = 'users';
}

abstract class DatabaseMealCategories {
  static const String europeanCuisine = 'european-cuisine';
  static const String japaneseCuisine = 'japanese-cuisine';
  static const String barbecueMenu = 'barbecue-menu';
  static const String bar = 'bar';
  static const String hookah = 'hookah';
}

abstract class DatabaseMealFields {
  static const String title = 'title';
  static const String subtitle = 'subtitle';
  static const String imageURL = 'imageURL';
  static const String cost = 'cost';
  static const String likesCount = 'likesCount';
  static const String grams = 'grams';
  static const String category = 'category';
  static const String date = 'date';
}
