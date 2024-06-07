import 'package:flutter/material.dart';
import 'package:project_ebook/Pages/BookDetails/BookActionBt.dart';
import 'Headerwidget.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              //height: 450,
              padding: const EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primary,
              child: const Row(children: [
                Expanded(
                  child: BookDetailsHeader(),
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
                        "n publishing and graphic design,lorem ipsum is a placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage.",
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
                        "n publishing and graphic design,lorem ipsum is a placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage. ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const BookActionBt(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
