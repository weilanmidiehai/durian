import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../util/image_picker_helper.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //底部NavigationBar透明
      extendBodyBehindAppBar: true, //顶部Bar透明
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            // color: Colors.yellowAccent,
            height: 350.0,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight - 45,
                      child: const Image(
                        image: AssetImage("assets/lily.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth / 2 - 50,
                      top: constraints.maxHeight - 100,
                      child: InkWell(
                        onTap: () {
                          //ImageSource.camera 照相机 或 ImageSource.gallery 相册
                          ImagePickerHelper(context).pickWithCropImage(
                              ImageSource.gallery, (croppedFile) {
                            //获取到剪切的文件路径，进行相关的操作
                            debugPrint("croppedFile:${croppedFile.path}");
                            setState(() {
                              imagePath = croppedFile.path;
                            });
                          });
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: imagePath.isEmpty
                                ? const Image(
                                    image: AssetImage("assets/logo.png"),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fitWidth,
                                  )
                                : Image.memory(
                                    File(imagePath).readAsBytesSync(),
                                    gaplessPlayback: true,
                                    width: 100,
                                    height: 100)),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            color: Colors.greenAccent,
            height: 100,
          )
        ],
      ),
    );
  }
}
