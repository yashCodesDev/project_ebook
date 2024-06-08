import 'package:flutter/material.dart';
import 'package:project_ebook/Models/book_model.dart';
import 'package:project_ebook/Pages/BookDetails/BookActionBt.dart';
import 'Headerwidget.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;
  const BookDetails({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primary,
              child: Row(children: [
                Expanded(
                  child: BookDetailsHeader(
                    coverUrl: book.coverUrl!,
                    title: book.title!,
                    author: book.author!,
                    description: book.description!,
                    rating: book.rating!,
                    pages: book.pages.toString(),
                    language: book.language!,
                    audiolen: book.audioLen!,
                  ),
                ),
              ])),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "About Book",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        book.description!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "About Author",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        book.aboutAuthor!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                BookActionBt(
                  bookUrl: book.bookurl.toString(),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
