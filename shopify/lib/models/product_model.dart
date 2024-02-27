class ProductModel {
  final dynamic id;
  final dynamic price;
  final String title;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      rating: RatingModel.fromJon(json['rating']),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJon(json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }
}
