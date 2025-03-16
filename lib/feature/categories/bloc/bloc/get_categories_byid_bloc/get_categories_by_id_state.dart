import '../../../../../core/domin/model/categories_model/get_category_byid_model.dart';

class GetCategoriesByIdState {}

final class GetCategoriesByIdInitial extends GetCategoriesByIdState {}
class GetCategoriesBySuccessState extends GetCategoriesByIdState {
  final List<GetCategoryByIdModel> getCategories;

 GetCategoriesBySuccessState({required this.getCategories});
}

class GetCategoriesByLoadingState extends GetCategoriesByIdState {}

class GetCategoriesByFieldState extends GetCategoriesByIdState {}
