import 'package:flutter/material.dart';

import '../logic/item_cart.dart';
import 'app_images.dart';

class ListViewCart extends StatefulWidget {
  const ListViewCart({super.key});

  @override
  State<ListViewCart> createState() => _ListViewCartState();
}

class _ListViewCartState extends State<ListViewCart> {
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
