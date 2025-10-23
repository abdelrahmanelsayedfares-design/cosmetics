import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Discover amazing features in our app!",
          image: Image.asset('on_boarding_1.png'),
        ),
        PageViewModel(
          title: "Fast & Easy",
          body: "Get things done quickly and easily.",
          image: Image.asset('on_boarding_2.png'),
        ),
        PageViewModel(
          title: "Welcome",
          body: "Discover amazing features in our app!",
          image: Image.asset('on_boarding_3.png'),
        ),
      ],
      onDone: () {
        // Go to next page or home
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
