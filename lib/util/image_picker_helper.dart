import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

/// @description: 从相册或照相机里选取图片的工具，带裁剪功能
class ImagePickerHelper {
  BuildContext buildContext;

  ImagePickerHelper(this.buildContext);

  void pickImage(ImageSource source, ImagePickerCallback? callback) {
    ImagePicker().pickImage(source: source).then((image) {
      if (image == null) return;
      if (callback == null) return;
      callback.call(image);
    }).onError((error, stackTrace) {
      debugPrint("获取图片失败:$error");
    });
  }

  void cropImage(File originalImage, ImageCropCallback? callback) {
    Future<CroppedFile?> future = ImageCropper().cropImage(
      sourcePath: originalImage.path,
      maxWidth: 100,
      maxHeight: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '',
            toolbarColor: Colors.white,
            statusBarColor: Colors.white,
            toolbarWidgetColor: Colors.green,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '11',
        ),
        // WebUiSettings(
        //   context: buildContext,
        // ),
      ],
    );
    future.then((value) {
      debugPrint("_cropImage path:${value == null ? "" : value.path}");
      if (value == null) return;
      if (callback == null) return;
      callback.call(value);
    }).onError((error, stackTrace) {
      debugPrint("裁剪图片失败:$error");
    });
  }

  void pickWithCropImage(ImageSource source, ImageCropCallback? callback) {
    pickImage(source, (xFile) {
      cropImage(File(xFile.path), callback);
    });
  }
}

typedef ImagePickerCallback = void Function(XFile xFile);
typedef ImageCropCallback = void Function(CroppedFile croppedFile);
