
import 'package:flutter/material.dart';

///点击图片放大弹窗
imageDialog(BuildContext context, {String? url, Widget? image}) {
  Dialog dialog = Dialog(
    insetPadding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    child: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.1,
                maxScale: 4.0,
                child: image ??
                    Image.network(
                      url ?? '', // 使用传递的图片URL
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
  showDialog(context: context, builder: (_) => dialog);
}