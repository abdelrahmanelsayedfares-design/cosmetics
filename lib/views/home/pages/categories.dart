import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';

import '../../../core/logic/item_cateories.dart';
import '../../../core/ui/text_feild.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Categories',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, left: 13, right: 13),
            child: Column(
              children: [
                TextFormFeild(),
                SizedBox(height: 32),
                ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 30,
                  ).copyWith(bottom: 100),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Divider(color: Color(0xffB3B3C180)),
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemCategories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: AppImage(
                              image: itemCategories[index].image,
                              width: 64,
                              height: 69,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            itemCategories[index].text,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff434C6D),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          AppImage(image: 'forward.svg'),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
