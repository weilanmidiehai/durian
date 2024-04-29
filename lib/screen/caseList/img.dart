import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Img extends StatefulWidget {
  const Img({Key? key}) : super(key: key);

  @override
  State<Img> createState() => _ImgState();
}

class _ImgState extends State<Img> {
  final picker = ImagePicker();
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImagePicker"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ElevatedButton(onPressed: showPicker, child: const Text("底部弹出选择")),
            ElevatedButton(onPressed: _takePhoto, child: const Text("拍照")),
            ElevatedButton(onPressed: _openGallery, child: const Text("打开相册")),
            _imageFile == null
                ? const Text("请选择图片")
                : Image.file(File(_imageFile!.path)),
          ],
        ),
      ),
    );
  }

  //弹出选择相册/拍照对话框
  showPicker() {
    //底部弹出
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext con) => Container(
              height: 160,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    onTap: (() {
                      _takePhoto();
                    }),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text('拍照'),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      _openGallery();
                    }),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text('相册'),
                    ),
                  )
                ],
              ),
            ));
  }

  //拍照
  _takePhoto() async {
    XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 600);

    if (pickedFile != null) {
      debugPrint(pickedFile.path);
      debugPrint('${File(pickedFile.path)}');
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  //打开文件夹
  _openGallery() async {
    XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 600, maxWidth: 600);

    if (pickedFile != null) {
      debugPrint('文件路径:${pickedFile.path}');
      debugPrint('文件:${File(pickedFile.path)}');
      debugPrint(
          '文件大小:${FileSize.getFileSizeString(bytes: File(pickedFile.path).lengthSync())}');
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }
}

class FileSize {
  static String getFileSizeString({required int bytes, int decimals = 0}) {
    if (bytes <= 0) return "0 Bytes";
    const suffixes = ["Bytes", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}
