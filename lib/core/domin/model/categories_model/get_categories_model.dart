// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class GetCategoriesModel {
  final int id;
  final String category_name;
  final String category_description;
  final String categorye_image;
  GetCategoriesModel({
    required this.id,
    required this.category_name,
    required this.category_description,
    required this.categorye_image,
  });

  GetCategoriesModel copyWith({
    int? id,
    String? category_name,
    String? category_description,
    String? categorye_image,
  }) {
    return GetCategoriesModel(
      id: id ?? this.id,
      category_name: category_name ?? this.category_name,
      category_description: category_description ?? this.category_description,
      categorye_image: categorye_image ?? this.categorye_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_name': category_name,
      'category_description': category_description,
      'categorye_image': categorye_image,
    };
  }

  factory GetCategoriesModel.fromMap(Map<String, dynamic> map) {
    return GetCategoriesModel(
      id: map['id'] as int,
      category_name: map['category_name'] as String,
      category_description: map['category_description'] as String,
      categorye_image: map['categorye_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCategoriesModel.fromJson(String source) => GetCategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetCategoriesModel(id: $id, category_name: $category_name, category_description: $category_description, categorye_image: $categorye_image)';
  }

  @override
  bool operator ==(covariant GetCategoriesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.category_name == category_name &&
      other.category_description == category_description &&
      other.categorye_image == categorye_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      category_name.hashCode ^
      category_description.hashCode ^
      categorye_image.hashCode;
  }
}
