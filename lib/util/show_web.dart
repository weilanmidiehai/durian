import 'package:durian/widget/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWeb extends StatelessWidget {
  const ShowWeb({super.key, required this.url, this.title});

  final String url;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: title ?? '外部链接',
      actions: [
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.copy_rounded,
            ),
          ),
          onTap: () {
            Clipboard.setData(ClipboardData(text: url));
            // logic.setMultiple();
          },
        )
      ],
      body: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            // ..setBackgroundColor( Colors.greenAccent)
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                  const CircularProgressIndicator();
                  const Text('加载中');
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(url))),
    );
  }
}
