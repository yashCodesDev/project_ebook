// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_ebook/Controller/book_controller.dart';
// import 'package:project_ebook/Models/book_model.dart';
// import 'package:project_ebook/Pages/BookDetails/book_action_bt.dart';

// import 'Headerwidget.dart';

// class BookDetails extends StatelessWidget {
//   final BookModel book;

//   const BookDetails({
//     super.key,
//     required this.book,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // BookController bookController = Get.put(BookController());
//     return Scaffold(
//         body: Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//                 padding: const EdgeInsets.all(10),
//                 color: Theme.of(context).colorScheme.primary,
//                 child: Row(children: [
//                   Expanded(
//                     child: BookDetailsHeader(
//                       coverUrl: book.coverUrl!,
//                       title: book.title!,
//                       author: book.author!,
//                       description: book.description!,
//                       rating: book.rating!,
//                       pages: book.pages.toString(),
//                       language: book.language!,
//                       audiolen: book.audioLen!,
//                     ),
//                   ),
//                 ])),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         "About Book",
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: Text(
//                           book.description!,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Text(
//                         "About Author",
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Flexible(
//                         child: Text(
//                           book.aboutAuthor!,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                       ),
//                     ],
//                   ),

//                   // Spacer added here
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: BookActionBt(
//                 bookUrl: book.bookurl!,
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:project_ebook/Models/book_model.dart';
import 'package:project_ebook/Pages/BookDetails/book_action_bt.dart';
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Theme.of(context).colorScheme.primary,
                    child: Row(
                      children: [
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
                            bookId: book.id!,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: BookActionBt(
              bookUrl: book.bookurl!,
            ),
          ),
        ],
      ),
    );
  }
}
