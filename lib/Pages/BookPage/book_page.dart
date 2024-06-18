import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ebook/Controller/Pdf_controller.dart';
import 'package:project_ebook/Controller/book_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookPage extends StatelessWidget {
  final String bookUrl;
  const BookPage({super.key, required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    Pdf_controller pdf_controller = Get.put(Pdf_controller());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).colorScheme.background,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Book",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pdf_controller.pdfViewerKey.currentState?.openBookmarkView();
        },
        child: Icon(
          Icons.bookmark,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      body: SfPdfViewer.network(
        bookUrl,
        key: pdf_controller.pdfViewerKey,
      ),
    );
  }
}
