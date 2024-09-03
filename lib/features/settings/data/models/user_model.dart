class UserModel {
  UserModel({
    required this.email,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.favoritesMeals, 
  });

  final String email;
  final String id;
  final String name;
  final String? phoneNumber;
  final List<Map<String, dynamic>> favoritesMeals;
}
