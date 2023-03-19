
import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  CategoriesModel({
    this.name,
    this.id,
    this.image,
    this.subcategories,
    this.images,
  });

  String name;
  String id;
  String image;
  List<Subcategory> subcategories;
  String images;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    name: json["name"],
    id: json["id"],
    image: json["image"] == null ? null : json["image"],
    subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
    images: json["images"] == null ? null : json["images"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "image": image == null ? null : image,
    "subcategories": List<dynamic>.from(subcategories.map((x) => x.toJson())),
    "images": images == null ? null : images,
  };
}

class Subcategory {
  Subcategory({
    this.name,
    this.id,
  });

  String name;
  String id;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
