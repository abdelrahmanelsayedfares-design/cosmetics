import 'package:flutter/material.dart';

import 'app_images.dart';

class TextFormFeild extends StatelessWidget {
  const TextFormFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        hintText: 'Search',
      suffixIcon: AppImage(image: 'search.svg',
      width: 16.758766174316406,
        height:17.605241775512695 ,
      ),
      ),

    );
  }
}
