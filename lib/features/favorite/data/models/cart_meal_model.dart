class CartMealModel {
  final String id;
  final String title;
  final int cost;
  final String imageURL;

  CartMealModel({
    required this.id,
    required this.title,
    required this.cost,
    required this.imageURL,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'cost': cost,
      'imageURL': imageURL,
    };
  }

  factory CartMealModel.fromMap(Map<String, dynamic> map) {
    return CartMealModel(
      id: map['id'] as String,
      title: map['title'] as String,
      cost: map['cost'] as int,
      imageURL: map['imageURL'] as String,
    );
  }
}
