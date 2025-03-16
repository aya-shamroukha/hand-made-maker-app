// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetCategoryByIdModel {
  final int id;
  final int category;
  final int maker;
  final int handcraft_count;
   final String handcraft_name;
    final String handcraft_price;
     final String handcraft_image;
  GetCategoryByIdModel({
    required this.id,
    required this.category,
    required this.maker,
    required this.handcraft_count,
    required this.handcraft_name,
    required this.handcraft_price,
    required this.handcraft_image,
  });

  GetCategoryByIdModel copyWith({
    int? id,
    int? category,
    int? maker,
    int? handcraft_count,
    String? handcraft_name,
    String? handcraft_price,
    String? handcraft_image,
  }) {
    return GetCategoryByIdModel(
      id: id ?? this.id,
      category: category ?? this.category,
      maker: maker ?? this.maker,
      handcraft_count: handcraft_count ?? this.handcraft_count,
      handcraft_name: handcraft_name ?? this.handcraft_name,
      handcraft_price: handcraft_price ?? this.handcraft_price,
      handcraft_image: handcraft_image ?? this.handcraft_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'maker': maker,
      'handcraft_count': handcraft_count,
      'handcraft_name': handcraft_name,
      'handcraft_price': handcraft_price,
      'handcraft_image': handcraft_image,
    };
  }

  factory GetCategoryByIdModel.fromMap(Map<String, dynamic> map) {
    return GetCategoryByIdModel(
      id: map['id'] as int,
      category: map['category'] as int,
      maker: map['maker'] as int,
      handcraft_count: map['handcraft_count'] as int,
      handcraft_name: map['handcraft_name'] as String,
      handcraft_price: map['handcraft_price'] as String,
      handcraft_image: map['handcraft_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCategoryByIdModel.fromJson(String source) => GetCategoryByIdModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetCategoryByIdModel(id: $id, category: $category, maker: $maker, handcraft_count: $handcraft_count, handcraft_name: $handcraft_name, handcraft_price: $handcraft_price, handcraft_image: $handcraft_image)';
  }

  @override
  bool operator ==(covariant GetCategoryByIdModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.category == category &&
      other.maker == maker &&
      other.handcraft_count == handcraft_count &&
      other.handcraft_name == handcraft_name &&
      other.handcraft_price == handcraft_price &&
      other.handcraft_image == handcraft_image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      category.hashCode ^
      maker.hashCode ^
      handcraft_count.hashCode ^
      handcraft_name.hashCode ^
      handcraft_price.hashCode ^
      handcraft_image.hashCode;
  }
}
