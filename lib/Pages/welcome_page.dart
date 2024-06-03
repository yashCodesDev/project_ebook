import 'package:flutter/material.dart';
import 'package:project_ebook/Components/primary_button.dart';
import 'package:project_ebook/Config/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 450,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "Assets/Images/book.png",
                        width: 360,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "E - Book : A Centralized Library",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.background),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Flexible(
                        child: Text(
                          "Unlock Your Literary Adventure: Explore a Vast Collection of Handpicked Masterpieces and Hidden Gems",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: EColors.secondLabelColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Disclaimer",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 20, color: EColors.labelColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                        child: Text(
                      "The content provided in this app is for informational purposes only. While we strive to present accurate and up-to-date information, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability of the content contained within the app.",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: EColors.labelColor),
                    ))
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PrimaryButton(
              btnName: 'Continue',
              ontap: () {},
            ),
          )
        ],
      ),
    );
  }
}
