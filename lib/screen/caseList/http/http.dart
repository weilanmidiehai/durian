import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dio.dart';
import 'download_with_chunks.dart';
import 'http_client.dart';
import 'web_socket_route.dart';

class HTTP extends StatelessWidget {
  const HTTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const HttpTestRoute());
                },
                child: const Text('通过HttpClient发起HTTP请求')),
            const Text('1.在请求阶段弹出loading  '
                '2.请求结束后，如果请求失败，则展示错误信息；如果成功，则将项目名称列表展示出来。'),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const FutureBuilderRoute());
                },
                child: const Text('Http请求库-dio')),
            ElevatedButton(
                onPressed: () async {
                  var url =
                      "http://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
                  var savePath = "./example/HBuilder.9.0.2.macosx_64.dmg";
                  await downloadWithChunks(url, savePath,
                      onReceiveProgress: (received, total) {
                    if (total != -1) {
                      debugPrint("${(received / total * 100).floor()}%");
                    }
                  });
                },
                child: const Text('Http分块下载（失败了，接口404）')),
            const Text(
                'Http协议是无状态的，只能由客户端主动发起，服务端再被动响应，服务端无法向客户端主动推送内容，并且一旦服务器响应结束，链接就会断开(见注解部分)，所以无法进行实时通信。WebSocket协议正是为解决客户端与服务端实时通信而产生的技术，现在已经被主流浏览器支持，所以对于Web开发者来说应该比较熟悉了，Flutter也提供了专门的包来支持WebSocket协议。'),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const WebSocketRoute());
                },
                child: const Text('WebSocket协议'))
          ],
        ),
      ),
    );
  }
}
