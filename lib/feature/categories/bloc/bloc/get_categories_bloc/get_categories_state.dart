import '../../../../../core/domin/model/categories_model/get_categories_model.dart';

class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesSuccessState extends GetCategoriesState {
  final List<GetCategoriesModel> getCategories;

  GetCategoriesSuccessState({required this.getCategories});
}

class GetCategoriesLoadingState extends GetCategoriesState {}

class GetCategoriesFieldState extends GetCategoriesState {}
