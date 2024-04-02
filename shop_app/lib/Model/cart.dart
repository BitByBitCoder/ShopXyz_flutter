class Cart {
  final int id;
  final int userId;
  final DateTime date;
  final List<Product> products;
  final int v; // Renamed from __v

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v, // Renamed from __v
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: (json['products'] as List)
          .map((productJson) => Product(
                productId: productJson['productId'],
                quantity: productJson['quantity'],
              ))
          .toList(),
      v: json['__v'], // Renamed from __v
    );
  }
  Cart copyWith(
      {int? id, int? userId, DateTime? date, List<Product>? products, int? v}) {
    return Cart(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      products: products ?? this.products,
      v: v ?? this.v,
    );
  }
}

class Product {
  final int productId;
  final int quantity;

  Product({required this.productId, required this.quantity});
}
