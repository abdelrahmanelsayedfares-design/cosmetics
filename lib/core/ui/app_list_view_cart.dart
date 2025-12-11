import 'package:flutter/material.dart';

import 'app_images.dart';

class AppListViewCart extends StatefulWidget {
  const AppListViewCart({super.key});

  @override
  State<AppListViewCart> createState() => _AppListViewCartState();
}

class _AppListViewCartState extends State<AppListViewCart> {

  List<_ItemCart> itemCart = [
    _ItemCart(
      image:
      'https://i.pinimg.com/474x/29/14/e4/2914e4609014a1f41e0259dd9bac2ad5.jpg',
      text: 'Note Cosmetics',
      body: 'Ultra rich mascara for lashes',
      price: '350 EGP',
    ),
    _ItemCart(
      image:
      'https://i.pinimg.com/474x/ca/23/cd/ca23cd1a11a43b9e2c373ea8896bf452.jpg',
      price: '490 EGP',
      text: 'ARTDECO',
      body: 'Bronzer - 02 ',
    ),
    _ItemCart(
      image:
      'https://avatars.mds.yandex.net/i?id=0e2fb71c840fb69b25edb79c5b79eebd03bbcb65-5142967-images-thumbs&n=13',
      price: '260 EGP',
      body: 'Lipstick - shade 9 - 02 ',
      text: 'Fendi ',
    ),
    _ItemCart(
      image: 'https://cdn1.ozone.ru/s3/multimedia-1-x/7256074173.jpg',
      price: '15.000 EGP',
      body: 'L’eau de perfum N5 ',
      text: 'Channel  ',
    ),
  ];



  late List<int> quantities;
  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(itemCart.length, 1);
  }


  @override
  Widget build(BuildContext context) {
    return     ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 6,
      ).copyWith(bottom: 100),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Divider(),
      ),
      itemCount: itemCart.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AppImage(
                      image:
                      itemCart[index].image,
                      width: 102,
                      height: 102,
                    ),
                  ),
                ),
                IconButton(onPressed: (){}, icon: AppImage(image: 'delete.svg')),
              ],
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemCart[index].text,
                    style: TextStyle(
                      color: Color(0xff3B4569),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    itemCart[index].body,
                    style: TextStyle(
                      color: Color(0xff3B4569BA),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    itemCart[index].price,
                    style: TextStyle(
                      color: Color(0xff3B4569),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff8E8EA9)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 142,
                      height: 42,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantities[index]>1) {
                                  setState(() {
                                    quantities[index]--;
                                  });
                                }
                              },
                              icon: AppImage(
                                image: 'minus.svg',
                                width: 20,
                              ),
                            ),
                            Text(
                              '${quantities[index]}',
                              style: TextStyle(
                                color: Color(0xff434C6D),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantities[index]++;
                                });
                              },
                              icon: AppImage(
                                image: 'plus.svg',
                                width: 16,
                                height: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
class _ItemCart {
  final String image;
  final String text;
  final String body;
  final String price;

  _ItemCart({
    required this.image,
    required this.text,
    required this.body,
    required this.price,
  });
}