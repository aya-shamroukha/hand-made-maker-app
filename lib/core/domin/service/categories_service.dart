import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/local_storage/shared_preferences.dart';
import '../model/categories_model/get_categories_model.dart';
import '../model/error_model.dart';

abstract class CategoriesService {
  getCategoriesForCustomerAndmMaker();
  getCategoriesbyId(int id);
  late String baseUrl = 'http://199.192.19.220:5400/';
}

class CategoriesImpl extends CategoriesService {
  @override
  getCategoriesForCustomerAndmMaker() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get('${baseUrl}categories/makerandcustomer',
          options: Options(sendTimeout: const Duration(seconds: 60), headers: {
            "Content-Type": "application/json",
            "Connection": "keep-alive",
            "Authorization":
                'Token ${getIt.get<SharedPreferences>().getString('token')}'
          }));

      if (response.statusCode == 200) {
        print(response.data);

        return response.data; // Return success
      } else {
        return 'false'; // Return error
      }
    } on DioException catch (e) {
      print(ErrorModel(message: e.message.toString()));
      return 'false'; // Return error
    }
  }
  
  @override
  getCategoriesbyId(int id) async{
    Dio dio = Dio();
    try {
      Response response = await dio.get('${baseUrl}handcraft/by-category/${id}',
          options: Options(sendTimeout: const Duration(seconds: 60), headers: {
            "Content-Type": "application/json",
            "Connection": "keep-alive",
            "Authorization":
                'Token ${getIt.get<SharedPreferences>().getString('token')}'
          }));

      if (response.statusCode == 200) {
        print(response.data);

        return response.data; // Return success
      } else {
        return 'false'; // Return error
      }
    } on DioException catch (e) {
      print(ErrorModel(message: e.message.toString()));
      return 'false'; // Return error
    }
  }
}
