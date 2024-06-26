import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_ebook/Controller/book_controller.dart';

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.find<BookController>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          InkWell(
              onTap: () {}, child: SvgPicture.asset("Assets/Icons/search.svg")),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: bookController.searchTextController,
              onFieldSubmitted: (value) {
                bookController.searchBooks(value);
              },
              decoration: const InputDecoration(
                hintText: "Search here . .",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
