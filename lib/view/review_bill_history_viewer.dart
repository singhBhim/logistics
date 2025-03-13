import 'package:flutter/material.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReviewBillHistoryViewer extends StatefulWidget {
  final String bol;
  const ReviewBillHistoryViewer({super.key, required this.bol});

  @override
  State<ReviewBillHistoryViewer> createState() =>
      ReviewBillHistoryViewerState();
}

class ReviewBillHistoryViewerState extends State<ReviewBillHistoryViewer> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = true; // Initially, set loading to true
  @override
  Widget build(BuildContext context) {
    // WebViewController controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //       },
    //       onPageStarted: (value) {
    //         setState(() {
    //           isLoading = true;
    //         });
    //       },
    //       onPageFinished: (value) {
    //         setState(() {
    //           isLoading = false;
    //         });
    //       },
    //       onHttpError: (HttpResponseError error) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.startsWith(widget.bol.toString())) {
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse(widget.bol.toString()));

    return Scaffold(
      appBar: customAppbar(text: "Review Bills History"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfPdfViewer.network(
            widget.bol.toString(),
            password: 'syncfusion'),
      ),
    );
  }
}
