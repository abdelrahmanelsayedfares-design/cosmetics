class Item_Cart {
  final String image;
  final String text;
  final String body;
  final String price;

  Item_Cart({
    required this.image,
    required this.text,
    required this.body,
    required this.price,
  });
}

List<Item_Cart> itemCart = [
  Item_Cart(
    image:
        'https://i.pinimg.com/474x/29/14/e4/2914e4609014a1f41e0259dd9bac2ad5.jpg',
    text: 'Note Cosmetics',
    body: 'Ultra rich mascara for lashes',
    price: '350 EGP',
  ),
  Item_Cart(
    image:
        'https://i.pinimg.com/474x/ca/23/cd/ca23cd1a11a43b9e2c373ea8896bf452.jpg',
    price: '490 EGP',
    text: 'ARTDECO',
    body: 'Bronzer - 02 ',
  ),
  Item_Cart(
    image:
        'https://avatars.mds.yandex.net/i?id=0e2fb71c840fb69b25edb79c5b79eebd03bbcb65-5142967-images-thumbs&n=13',
    price: '260 EGP',
    body: 'Lipstick - shade 9 - 02 ',
    text: 'Fendi ',
  ),
  Item_Cart(
    image:
        'https://cdn1.ozone.ru/s3/multimedia-1-x/7256074173.jpg',
    price: '15.000 EGP',
    body: 'L’eau de perfum N5 ',
    text: 'Channel  ',
  ),
];
