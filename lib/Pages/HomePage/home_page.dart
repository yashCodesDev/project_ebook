// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:project_ebook/Components/book_card.dart';
// import 'package:project_ebook/Controller/book_controller.dart';
// import 'package:project_ebook/Models/Data.dart';
// import 'package:project_ebook/Pages/HomePage/Widgets/app_bar.dart';
// import 'package:project_ebook/Pages/HomePage/Widgets/category_widget.dart';
// import 'package:project_ebook/Pages/HomePage/Widgets/my_input_textfield.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     BookController bookController = Get.put(BookController());
//     // bookController.getUserBook();
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
//               color: Theme.of(context).colorScheme.primary,
//               // height: 450,
//               child: Expanded(
//                   child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         const HomeAppBar(),
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "Good Morning ✌️",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyLarge
//                                   ?.copyWith(
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .background),
//                             ),
//                             Text("Yash",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.copyWith(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .background)),
//                           ],
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: [
//                             Flexible(
//                               child: Text(
//                                 "Time to read book and enhance your knowledge",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .labelLarge
//                                     ?.copyWith(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .background),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 30),
//                         const MyInputTextField(),
//                         const SizedBox(height: 40),
//                         Row(
//                           children: [
//                             Text(
//                               "Topics",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .labelLarge
//                                   ?.copyWith(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .background,
//                                   ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: categoryData
//                                 .map((e) => CategoryWidget(
//                                     iconPath: e["icon"]!, btnName: e["label"]!))
//                                 .toList(),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               )),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Text(
//                   "Your Interests",
//                   style: Theme.of(context).textTheme.labelMedium,
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: bookData
//                     .map((e) => BookCard(
//                         coverUrl: e.coverUrl!, title: e.title!, ontap: () {}))
//                     .toList(),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ebook/Components/book_card.dart';
import 'package:project_ebook/Components/book_tile.dart';
import 'package:project_ebook/Controller/book_controller.dart';
import 'package:project_ebook/Models/Data.dart';
import 'package:project_ebook/Pages/HomePage/Widgets/app_bar.dart';
import 'package:project_ebook/Pages/HomePage/Widgets/category_widget.dart';
import 'package:project_ebook/Pages/HomePage/Widgets/my_input_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const HomeAppBar(),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        "Good Morning ✌️",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                      Text(" Yash",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "Time to read book and enhance your knowledge",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  const MyInputTextField(),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Text(
                        "Topics",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categoryData
                          .map((e) => CategoryWidget(
                              iconPath: e["icon"]!, btnName: e["label"]!))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Trending",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: bookData
                    .map((e) => BookCard(
                        coverUrl: e.coverUrl!, title: e.title!, ontap: () {}))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Your Interests",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: bookData
                  .map((e) => BookTile(
                        coverUrl: e.coverUrl!,
                        title: e.title!,
                        ontap: () {},
                        author: e.author!,
                        price: e.price!,
                        rating: e.rating!,
                        totalRating: e.numberofRating!,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
