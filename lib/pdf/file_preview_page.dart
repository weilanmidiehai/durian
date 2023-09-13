import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen extends StatefulWidget {
  final String? path;
  final String? password;

  const PDFScreen({Key? key, this.path, this.password}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pdf查看"),
      ),
      body: PDFView(
        password: widget.password,
        filePath: widget.path,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: true,
        pageSnap: true,
        defaultPage: currentPage!,
        fitPolicy: FitPolicy.BOTH,
        preventLinkNavigation: false,
        // if set to true the link is handled in flutter
        onRender: (pages) {
          setState(() {
            pages = pages;
            isReady = true;
          });
        },
        onError: (error) {
          setState(() {
            errorMessage = error.toString();
          });
          print(error.toString());
        },
        onPageError: (page, error) {
          setState(() {
            errorMessage = '$page: ${error.toString()}';
          });
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },
        onLinkHandler: (String? uri) {
          print('goto uri: $uri');
        },
        onPageChanged: (int? page, int? total) {
          print('page change: $page/$total');
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}
