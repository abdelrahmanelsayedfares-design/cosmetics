import 'package:flutter/material.dart';
import 'app_images.dart';
import '../../model/item_image_crd.dart';

class GridVieww extends StatelessWidget {
  const GridVieww({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 176 / 290,
      ),
      itemCount: Item_Image_Card.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xffD9D9D9),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              spreadRadius: 0,
              blurRadius: 10,
              color: Color(0xff00000040).withValues(alpha: .25),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: [
                      AppImage(image: Item_Image_Card[index].image),
                      Positioned(
                        top: 14,
                        right: 14,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(8),
                              color: Color(0xffFFFAFA),
                            ),
                            child: Center(
                              child: AppImage(
                                image: 'Vector.svg',
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 11),
              Text(
                Item_Image_Card[index].terxt,
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 11),
              Text(
                Item_Image_Card[index].price,
                style: TextStyle(
                  color: Color(0xff70839C),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
