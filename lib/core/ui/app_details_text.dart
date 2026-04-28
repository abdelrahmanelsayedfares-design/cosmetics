import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  final String text;
  final String title;
  final FontWeight valueFontWeight;
  const DetailsText({
    super.key,
    required this.text,
    required this.title,
    this.valueFontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.labelSmall),
        Text(
          title,
          style: TextStyle(
            fontWeight: valueFontWeight,
            color: Color(0xff434C6D),
            fontSize: 12,
          ),
          // Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
