import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_images.dart';

class AppGridView extends StatelessWidget {
   AppGridView({super.key});
  List<_itemImageCard> Item_Image_Card = [
    _itemImageCard(
      terxt: 'Face tint / lip tint',
      image:
      'https://i.pinimg.com/originals/11/f5/22/11f522c7f8ead5519a4b102723f0a89c.jpg',
      price: '\$44.99',
    ),
    _itemImageCard(
      terxt: 'Athe Red lipstick',
      image: 'https://cdn.wconcept.com/products/7202026/08/720202608_1.jpg',
      price: '\$44.99',
    ),
    _itemImageCard(
      terxt: 'Athe Red lipstick',
      image: 'https://cdn.wconcept.com/products/7202026/08/720202608_1.jpg',
      price: '\$44.99',
    ),
    _itemImageCard(
      terxt: 'Face tint / lip tint',
      image:
      'https://i.pinimg.com/originals/11/f5/22/11f522c7f8ead5519a4b102723f0a89c.jpg',
      price: '\$44.99',
    ),
  ];
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
          padding: const EdgeInsets.all(8.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    AppImage(image: Item_Image_Card[index].image),
                    Padding(
                      padding: const EdgeInsets.only(top: 6,right: 6).r,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.circular(8),
                            color: Color(0xffFFFAFA),
                          ),
                          child: Center(
                            child: AppImage(
                              image: 'market.svg',
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
              SizedBox(height: 11.h),
              Text(
                Item_Image_Card[index].terxt,
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 11.h),
              Text(
                Item_Image_Card[index].price,
                style: TextStyle(
                  color: Color(0xff70839C),
                  fontSize: 12.sp,
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

class _itemImageCard {
  final String image;
  final String terxt;
  final String price;

  _itemImageCard({
    required this.image,
    required this.price,
    required this.terxt,
  });
}