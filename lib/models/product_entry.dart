// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    DateTime addedAt;
    bool isFeatured;
    int userId;
    final String username;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.addedAt,
        required this.isFeatured,
        required this.userId,
        required this.username,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        addedAt: DateTime.parse(json["added_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
        username: json['username']
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "added_at": addedAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
