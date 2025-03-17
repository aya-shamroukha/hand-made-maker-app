class ImagePickerEvent {}

class UploadImagegallery extends ImagePickerEvent {}

class UploadImageGalleryCamera extends ImagePickerEvent {}

class SaveImage extends ImagePickerEvent {
  final String val;

  SaveImage({required this.val});
}

class GetImage extends ImagePickerEvent {}

class DeleteImage extends ImagePickerEvent {}
