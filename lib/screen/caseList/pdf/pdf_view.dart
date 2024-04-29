import 'package:flutter/material.dart';
import 'file_preview_page.dart';
import 'pdf_path.dart';

class PdfView extends StatelessWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String abc = '';
    return Scaffold(
      appBar: AppBar(title: const Text('pdf example')),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text("本地PDF"),
              onPressed: () {
                PdfPath.fromAsset('assets/pdf/pdf.pdf', 'pdf.pdf').then((f) {
                  String corruptedPathPDF = f.path;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(path: corruptedPathPDF),
                    ),
                  );
                });
              },
            ),
            TextButton(
              child: const Text("网络PDF"),
              onPressed: () {
                PdfPath.createFileOfPdfUrl().then((f) {
                  String remotePDFpath = f.path;
                  debugPrint('1111$remotePDFpath');
                  if (remotePDFpath.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFScreen(path: remotePDFpath),
                      ),
                    );
                  }
                });
              },
            ),
            TextButton(
              child: const Text("本地PDF（带密码）"),
              onPressed: () {
                PdfPath.fromAsset('assets/pdf/pdf123456.pdf', 'pdf123456.pdf')
                    .then((f) {
                  abc = f.path;
                  debugPrint('corruptedPathPDF:::$abc');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PDFScreen(path: abc, password: '123456'),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
