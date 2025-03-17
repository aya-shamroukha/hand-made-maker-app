import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  File? image;

  String? imagePath;

  // Dio dio = Dio();

  final imagepicker = ImagePicker();
  ImagePickerBloc() : super(ImagePickerInitial()) {
    on<UploadImagegallery>((event, emit) async {
      var pickedimage2 =
          await imagepicker.pickImage(source: ImageSource.gallery);
      // Navigator.pop(context);

      if (pickedimage2 != null) {
        add(SaveImage(val: pickedimage2.path.toString()));

        image = File(pickedimage2.path);
        add(GetImage());
      } else {}
      emit(UploadImagegalleryState());
    });
    on<UploadImageGalleryCamera>(
      (event, emit) async {
        var pickedimage =
            await imagepicker.pickImage(source: ImageSource.camera);
        //Navigator.pop(context);
        if (pickedimage != null) {
          add(SaveImage(val: pickedimage.path.toString()));

          image = File(pickedimage.path);
          add(GetImage());
        } else {}
        emit(UploadImageGalleryCameraState());
      },
    );
    on<SaveImage>(
      (event, emit) async {
        final imageshared = await SharedPreferences.getInstance();
        imageshared.setString('path', event.val);
        add(GetImage());
        emit(SaveImageState());
        add(GetImage());
      },
    );
    on<GetImage>(
      (event, emit) async {
        final imageshared = await SharedPreferences.getInstance();
        imagePath = imageshared.getString('path');
        emit(GetImageState());
      },
    );
    on<DeleteImage>(
      (event, emit) async {
        final imageDel = await SharedPreferences.getInstance();
        imageDel.remove('path');
        add(GetImage());
        emit(DeleteImageState());
        //Navigator.of(context).pop();
      },
    );
  }
}
