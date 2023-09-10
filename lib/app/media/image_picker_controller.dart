import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  Future<XFile?> onPickImage({required ImageSource type,double maxWidth = 500,double maxHeight = 500}) async {
    var image = await ImagePicker().pickImage(
      source: type,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
    return image;
  }

  Future<File?> onPickVideo({required ImageSource type}) async {
    var video = await ImagePicker().pickVideo(source: type);
    if (video != null) {
      return File(video.path);
    } else {
      return null;
    }
  }


  Future<List<File>?> onPickMultiImagesImagePicker() async {
    var resultList = await ImagePicker().pickMultiImage();
      List<File> images = [];
      for (var element in resultList) {
        images.add(File(element.path));
      }
      return images;
  }

}
