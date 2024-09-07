/*
    just like java we will use this class for store the model that i will copy the
    data of the model from quick type that is the tools for generated the model
    from json to dart
 */

// To parse this JSON data, do
//
//     final fakeStore = fakeStoreFromJson(jsonString);

import 'dart:convert';

List<FakeStore> fakeStoreFromJson(String str) => List<FakeStore>.from(json.decode(str).map((x) => FakeStore.fromJson(x)));

String fakeStoreToJson(List<FakeStore> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeStore {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  Category? category;

  FakeStore({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
  });

  factory FakeStore.fromJson(Map<String, dynamic> json) => FakeStore(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "category": category?.toJson(),
  };
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
