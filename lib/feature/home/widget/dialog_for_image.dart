import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/app_color.dart';
import '../../../core/resources/app_string.dart';
import '../../../share/sized_box.dart';
import '../bloc/image_picker_bloc/image_picker_bloc.dart';
import '../bloc/image_picker_bloc/image_picker_event.dart';
import 'my_row_imagepiker.dart';

class DialogForImage extends StatelessWidget {
  const DialogForImage({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
            height: screenHeight * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Icon(
                  Icons.warning,
                  color: AppColor.primary,
                  size: 30,
                )),
                Text(
                  AppStrings.instructionsForTakePhoto.tr(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox_Height(
                  height: screenHeight * 0.03,
                ),
                CoustomRow(
                  icon: Icons.photo,
                  string: AppStrings.fromGallery.tr(),
                  ontap: () {
                    context.read<ImagePickerBloc>().add(UploadImagegallery());
                    Navigator.pop(context);
                  },
                ),
                SizedBox_Height(
                  height: 10.w,
                ),
                CoustomRow(
                  icon: Icons.camera_alt,
                  string: AppStrings.fromcamera.tr(),
                  ontap: () {
                    context
                        .read<ImagePickerBloc>()
                        .add(UploadImageGalleryCamera());
                    context.read<ImagePickerBloc>().add(GetImage());
                    Navigator.pop(context);
                  },
                ),
                // SizedBox_Height(
                //   height: 10.w,
                // ),
                // CoustomRow(
                //   icon: Icons.delete_forever,
                //   string: AppStrings.deleteimage.tr(),
                //   ontap: deleteImage,
                // ),
              ],
            )));
  }
}
