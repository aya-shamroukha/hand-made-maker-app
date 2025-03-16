

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand_made_maker/feature/categories/bloc/bloc/get_categories_bloc/get_categories_state.dart';

import '../../../../../core/domin/model/categories_model/get_categories_model.dart';
import '../../../../../core/domin/service/categories_service.dart';
import 'get_categories_event.dart';


class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  GetCategoriesBloc() : super(GetCategoriesInitial()) {
    on<GetCategoriesSuccessEvent>((event, emit)async {
      emit(GetCategoriesLoadingState());
      try{
        var getcategories = await CategoriesImpl().getCategoriesForCustomerAndmMaker();
        
      
         
            List<GetCategoriesModel> categories = List.generate(
                getcategories['data'].length,
                (index) =>
                    GetCategoriesModel.fromMap((getcategories['data'][index])));
            emit(GetCategoriesSuccessState(getCategories: categories));
          
       
        // Removed redundant emission of success state
        print('------------------------------------------');
      } catch (e) {
        print(e.toString());
        emit(GetCategoriesFieldState());
      }
    
    });
  }
}
