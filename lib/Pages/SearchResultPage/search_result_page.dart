// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:project_ebook/Components/book_tile.dart';
// // import 'package:project_ebook/Controller/book_controller.dart';
// // import 'package:project_ebook/Pages/BookDetails/book_details.dart';
// // import 'package:project_ebook/Pages/HomePage/home_page.dart';

// // class SearchResultsPage extends StatelessWidget {
// //   final BookController bookController = Get.find<BookController>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //             onPressed: () {
// //               Get.to(const HomePage());
// //             },
// //             icon: const Icon(Icons.arrow_back)),
// //         title: const Text('Search Results'),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             if (bookController.noResultsFound.value)
// //               Center(child: Text("No books found")),
// //             ...bookController.bookData
// //                 .map(
// //                   (e) => BookTile(
// //                     coverUrl: e.coverUrl!,
// //                     title: e.title!,
// //                     ontap: () {
// //                       Get.to(BookDetails(book: e));
// //                     },
// //                     author: e.author!,
// //                   ),
// //                 )
// //                 .toList(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:project_ebook/Components/book_tile.dart';
// // import 'package:project_ebook/Controller/book_controller.dart';
// // import 'package:project_ebook/Models/book_model.dart';
// // import 'package:project_ebook/Pages/BookDetails/book_details.dart';

// // class SearchResultsPage extends StatelessWidget {
// //   final String searchQuery;

// //   const SearchResultsPage({super.key, required this.searchQuery});

// //   @override
// //   Widget build(BuildContext context) {
// //     final BookController bookController = Get.find();

// //     // Perform search when page is built
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       bookController.searchBooks(searchQuery);
// //     });

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Search Results'),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Get.back(); // Navigate back to previous screen (HomePage)
// //           },
// //         ),
// //       ),
// //       body: Obx(() {
// //         if (bookController.isSearching.value) {
// //           return const Center(child: CircularProgressIndicator());
// //         } else {
// //           if (bookController.noResultsFound.value) {
// //             return const Center(child: Text("No books found"));
// //           } else {
// //             return ListView.builder(
// //               itemCount: bookController.bookData.length,
// //               itemBuilder: (context, index) {
// //                 BookModel book = bookController.bookData[index];
// //                 return BookTile(
// //                   coverUrl: book.coverUrl!,
// //                   title: book.title!,
// //                   author: book.author!,
// //                   ontap: () {
// //                     Get.to(BookDetails(book: book));
// //                   },
// //                 );
// //               },
// //             );
// //           }
// //         }
// //       }),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_ebook/Components/book_tile.dart';
// import 'package:project_ebook/Controller/book_controller.dart';
// import 'package:project_ebook/Models/book_model.dart';
// import 'package:project_ebook/Pages/BookDetails/book_details.dart';

// class SearchResultsPage extends StatelessWidget {
//   final String searchQuery;

//   const SearchResultsPage({Key? key, required this.searchQuery})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final BookController bookController = Get.find();

//     // Perform search when page is built
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       bookController.searchBooks(searchQuery);
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search Results'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             // Navigate back to previous screen (HomePage)
//             Get.offAllNamed(
//                 '/home'); // Assuming '/home' is the route to HomePage
//           },
//         ),
//       ),
//       body: Obx(() {
//         if (bookController.isSearching.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           if (bookController.noResultsFound.value) {
//             return const Center(child: Text("No books found"));
//           } else {
//             return ListView.builder(
//               itemCount: bookController.bookData.length,
//               itemBuilder: (context, index) {
//                 BookModel book = bookController.bookData[index];
//                 return BookTile(
//                   coverUrl: book.coverUrl!,
//                   title: book.title!,
//                   author: book.author!,
//                   ontap: () {
//                     Get.to(BookDetails(book: book));
//                   },
//                 );
//               },
//             );
//           }
//         }
//       }),
//     );
//   }
// }
