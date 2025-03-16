class GetCategoriesByIdEvent {}

class GetCategoriesByIdSuccessEvent extends GetCategoriesByIdEvent {
  final dynamic id;

  GetCategoriesByIdSuccessEvent({required this.id});
}
