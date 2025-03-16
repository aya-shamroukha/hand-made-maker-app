// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/resources/app_color.dart';
import '../../../core/resources/app_string.dart';
import '../../../share/positioned_for_icon.dart';
import '../../../share/sized_box.dart';
import '../widget/my_row_imagepiker.dart';

class CategoriesDetails extends StatefulWidget {
  const CategoriesDetails({super.key});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  File? image;
  String? imagePath;
  final imagepicker = ImagePicker();
  //! upload image from gallery
  uploadimagegallery() async {
    var pickedimage2 = await imagepicker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);

    if (pickedimage2 != null) {
      saveImage(pickedimage2.path.toString());
      setState(() {
        image = File(pickedimage2.path);
      });
    } else {}
  }

//! upload image from cameria
  uploadimagegallerycam() async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (pickedimage != null) {
      saveImage(pickedimage.path.toString());
      setState(() {
        image = File(pickedimage.path);
      });
    } else {}
  }

//! save image with path
  saveImage(String val) async {
    final imageshared = await SharedPreferences.getInstance();
    imageshared.setString('path', val);
    getImage();
  }

//!get image from path
  getImage() async {
    final imageshared = await SharedPreferences.getInstance();
    setState(() {
      imagePath = imageshared.getString('path');
    });
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

//!delete image
  void deleteImage() async {
    final imageDel = await SharedPreferences.getInstance();
    imageDel.remove('path');
    getImage();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;


        return Scaffold(
          body: Stack(
            children: [
              PositionedForIcon(
                left: 0,
                top: screenHeight * 0.04,
                iconColor: AppColor.blodbrownText,
                color: AppColor.brownText,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: screenHeight * 0.5,
                  width: screenWidth * 1,
                  decoration: BoxDecoration(
                      color: AppColor.brownText,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      )),
                ),
              ),
              // Positioned(
              //   bottom: screenHeight * 0.6,
              //   left: screenWidth * 0.2,
              //   child: Center(
              //     child: state is AiSuccessState
              //         ? Container(
              //             width: 400.w,
              //             height: 300.h,
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(20),
              //               child: Image.memory(
                              
              //                 Uint8List.fromList((state.imageUrl as String).codeUnits),
              //                 width: 400.w,
              //                 height: 300.h,
              //                 fit: BoxFit.fill,
              //                 errorBuilder: (context, error, stackTrace) {
              //                   log(state.imageUrl);
              //                   return FlutterLogo();
              //                 },
              //               ),
              //             ),
              //           )
              //         : SizedBox(
              //             child: CircularProgressIndicator(),
              //           ),
              //   ),
              // ),
              Positioned(
                  bottom: screenHeight * 0.5,
                  right: screenWidth * 0.03,
                  child: IconButton(
                      color: AppColor.brownText,
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                        AppColor.primary,
                      )),
                      onPressed: () {
                        showDialogForImage(context);
                      },
                      icon: Icon(
                        Icons.attach_file,
                        color: AppColor.background,
                        size: 20,
                      ))),
              Positioned(
                  bottom: 100,
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      height: 199.h,
                      width: 250.w,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Column(
                        children: [
                          imagePath == null
                              ? const Text('')
                              : Image.file(
                                  File(imagePath!),
                                  fit: BoxFit.cover,
                                ),
                          const Spacer(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     ElevatedButton(
                          //       onPressed: () {
                          //         Navigator.of(context).pop(); // Close dialog
                          //       },
                          //       child: const Text("Cancel"),
                          //     ),
                          //     ElevatedButton(
                          //       onPressed: () async {
                          //         // Trigger Bloc event
                          //         context.read<AiBlocBloc>().add(
                          //             AiEventSuccess(
                          //                 aiModel: AiModel(
                          //                     sofa_image:
                          //                         MultipartFile.fromFileSync(
                          //                       image!.path,
                          //                       filename: imagePath!
                          //                           .split('/')
                          //                           .last,
                          //                     ),
                          //                     pillow_image:
                          //                         MultipartFile.fromFileSync(
                          //                       image!.path,
                          //                       filename: imagePath!
                          //                           .split('/')
                          //                           .last,
                          //                       // await MultipartFile.fromFileSync(
                          //                       //     'http://199.192.19.220:5400/media/categories_images/Pillow-PNG-Download-Image_nrb5xnU.png',
                          //                       //     filename:
                          //                       //         'assets/images/وسادة.jpg'
                          //                       //             .split('/')
                          //                       //             .last),
                          //                     ))));
                              //   },
                              //   child: const Text("OK"),
                              // ),
                            ],
                          ),
            
                      ),
                    ),
                  )
            ],
          ),
        );
    
  }

  Future<dynamic> showDialogForImage(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
                  height: screenHeight * 0.54,
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
                          ontap: uploadimagegallery),
                      SizedBox_Height(
                        height: 10.w,
                      ),
                      CoustomRow(
                          icon: Icons.camera_alt,
                          string: AppStrings.fromcamera.tr(),
                          ontap: uploadimagegallerycam),
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
        });
  }
}
