import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoginOrRegister extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const AppLoginOrRegister({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Don’t have an account?',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffD75D72),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
