// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ride_application/core/resources/app_color.dart';
// import 'package:shimmer/shimmer.dart';

// class MyNetworkImage extends StatelessWidget {
//   const MyNetworkImage({
//     super.key,
//     required this.imageUrl,
//     this.width,
//     this.height,
//   });
//   final String imageUrl;
//   final double? width;
//   final double? height;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: CachedNetworkImage(
//             fadeInCurve: Curves.bounceIn,
//             fadeOutCurve: Curves.bounceInOut,
//             imageUrl: imageUrl,
//             fit: BoxFit.cover,
//             placeholder: (context, url) => Shimmer.fromColors(
//                   baseColor: Colors.grey.shade300,
//                   highlightColor: Colors.grey.shade100,
//                   child: Container(
//                     height: 40.h,
//                     width: 40.w,
//                     decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(12)),
//                   ),
//                 ),
//             errorWidget: (context, url, error) => SizedBox(
//                   width: 40.w,
//                   height: 40.h,
//                   child: CircularProgressIndicator(
//                     color: AppColor.primary,
//                   ),
//                 )),
//       ),
//     );
//   }
// }
