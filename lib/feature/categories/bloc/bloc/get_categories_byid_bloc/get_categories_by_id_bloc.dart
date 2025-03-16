

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domin/model/categories_model/get_category_byid_model.dart';
import '../../../../../core/domin/service/categories_service.dart';
import 'get_categories_by_id_event.dart';
import 'get_categories_by_id_state.dart';

class GetCategoriesByIdBloc extends Bloc<GetCategoriesByIdEvent, GetCategoriesByIdState> {
  GetCategoriesByIdBloc() : super(GetCategoriesByIdInitial()) {
    on<GetCategoriesByIdSuccessEvent>((event, emit)async {

     emit(GetCategoriesByLoadingState());
  try{
        var getcategories = await CategoriesImpl().getCategoriesbyId(event.id);
        
      
         
            List<GetCategoryByIdModel> categories = List.generate(
                getcategories['data'].length,
                (index) =>
                    GetCategoryByIdModel.fromMap((getcategories['data'][index])));
            emit(GetCategoriesBySuccessState(getCategories: categories));
          
       
        // Removed redundant emission of success state
        print('------------------------------------------');
      } catch (e) {
        print(e.toString());
        emit(GetCategoriesByFieldState());
      }
    
    });
  }
}
