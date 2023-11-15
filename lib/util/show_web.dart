import 'package:durian/widget/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWeb extends StatefulWidget {
  const ShowWeb({super.key, required this.url, this.title});
  final String url;
  final String? title;
  @override
  State<ShowWeb> createState() => _ShowWebState();
}

class _ShowWebState extends State<ShowWeb> {
  WebViewController controller = WebViewController();
  int load = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              setState(() {
                load = progress;
              });
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              // if (request.url.startsWith(widget.url)) {
              //   return NavigationDecision.prevent;
              // }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.url));
    });

  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.title ?? '外部链接',
      actions: [
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.copy_rounded,
            ),
          ),
          onTap: () {
            Clipboard.setData(ClipboardData(text: widget.url));
            // logic.setMultiple();
          },
        )
      ],
      body: load == 100
          ? WebViewWidget(controller: controller)
          :  Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('加载中 $load %')
                ],
              ),
            ),
    );
  }
}
