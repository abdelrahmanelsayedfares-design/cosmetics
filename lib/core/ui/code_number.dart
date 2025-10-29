import 'package:flutter/material.dart';

class CodeNumber extends StatelessWidget {
  const CodeNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xff434C6D).withValues(alpha: .4),
            width: 1.5,
          ),
        ),
        child: Text(
          '+20',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff434C6D),
          ),
        ),
      ),
    );
  }
}
