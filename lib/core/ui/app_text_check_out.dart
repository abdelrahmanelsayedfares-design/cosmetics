import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextCheckOut extends StatelessWidget {
  final String text;
  final String title;
  const AppTextCheckOut({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.labelSmall),
        Spacer(),
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
