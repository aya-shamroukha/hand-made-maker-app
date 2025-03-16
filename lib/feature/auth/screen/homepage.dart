import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/config/local_storage/shared_preferences.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_color.dart';
import '../../../share/shimmer_body.dart';
import '../../../share/sized_box.dart';
import '../../categories/bloc/bloc/get_categories_bloc/get_categories_bloc.dart';
import '../../categories/bloc/bloc/get_categories_bloc/get_categories_event.dart';
import '../../categories/bloc/bloc/get_categories_bloc/get_categories_state.dart';


class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
          GetCategoriesBloc()..add(GetCategoriesSuccessEvent()),
      child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesSuccessState) {
            return SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    SizedBox_Height(height: screenHeight * 0.03),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Icon(
                    //         Icons.location_on,
                    //         color: AppColor.primary,
                    //         size: 30,
                    //       ),
                    // Text(
                    //   getIt.get<SharedPreferences>().getString('address') == null
                    //       ? 'My location'
                    //       : '${getIt.get<SharedPreferences>().getString('address')}',
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .displayMedium!
                    //       .copyWith(color: AppColor.blodbrownText),
                    // ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Container(
                          height: screenHeight * 0.17,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: AppColor.lightbrownText,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColor.brownText)),
                          child: Image.asset(
                            AppAssets.sale,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.getCategories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                               getIt.get<SharedPreferences>().setInt(
                                            'id',
                                            state.getCategories[index].id);
                              Navigator.of(context).pushNamed('categoriesbyid');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Container(
                                height: screenHeight * 0.17,
                                width: screenWidth * 0.8,
                                decoration: BoxDecoration(
                                    color: AppColor.lightbrownText,
                                    borderRadius: BorderRadius.circular(20),
                                    border:
                                        Border.all(color: AppColor.brownText)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.getCategories[index]
                                                .category_name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                          Text(
                                            state.getCategories[index]
                                                .category_description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                                    color: AppColor.brown
                                                        .withOpacity(0.7)),
                                          ),
                                        ],
                                      ),
                                      SizedBox_width(width: 10.w),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          'http://199.192.19.220:5400/${state.getCategories[index].categorye_image}',
                                          width: screenWidth * 0.22,
                                          height: screenHeight * 1,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
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
    );
  }
}
