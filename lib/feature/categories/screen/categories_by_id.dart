import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/config/local_storage/shared_preferences.dart';

import '../../../core/resources/app_color.dart';
import '../../../share/positioned_for_icon.dart';
import '../../../share/shimmer_body.dart';
import '../../../share/sized_box.dart';
import '../bloc/bloc/get_categories_byid_bloc/get_categories_by_id_bloc.dart';
import '../bloc/bloc/get_categories_byid_bloc/get_categories_by_id_event.dart';
import '../bloc/bloc/get_categories_byid_bloc/get_categories_by_id_state.dart';

class CategoriesById extends StatelessWidget {
  const CategoriesById({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => GetCategoriesByIdBloc()
        ..add(GetCategoriesByIdSuccessEvent(
            id: getIt.get<SharedPreferences>().getInt(
                  'id',
                ))),
      child: SafeArea(
          child: Scaffold(
              body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox_width(
                width: 100.w,
              ),
              PositionedForIcon(top: screenHeight * 0.04),
            ],
          ),
          BlocBuilder<GetCategoriesByIdBloc, GetCategoriesByIdState>(
            builder: (context, state) {
              if (state is GetCategoriesBySuccessState) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: 2 / 3,
                        ),
                        itemCount: state.getCategories.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('categoriesdetails');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: screenWidth * 0.7,
                                    height: screenHeight * 0.2,
                                    decoration: BoxDecoration(
                                      color: AppColor.lightbrownText,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    // child: Card(
                                    //   color: AppColor.lightbrownText,
                                    //   shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(10),
                                    //   ),
                                    //   elevation: 3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'http://199.192.19.220:5400/${state.getCategories[index].handcraft_image}',
                                        width: screenWidth * 0.7,
                                        height: screenHeight * 0.02,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox_Height(height: 10),
                              Text(
                                state.getCategories[index].handcraft_name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                state.getCategories[index].handcraft_price,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 17),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          );
                        }),
                  ),
                );
              } else {
                return Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    width: 400,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: ((context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ShimmerBodyForImage(
                              height: 200.h,
                              width: 400.w,
                            ),
                          );
                        })),
                  ),
                );
              }
            },
          ),
        ],
      ))),
    );
  }
}
