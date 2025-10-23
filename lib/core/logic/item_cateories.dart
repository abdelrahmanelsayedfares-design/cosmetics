class Item_Categories {
  final String image;
  final String text;

  Item_Categories({required this.image, required this.text});
}

List<Item_Categories> itemCategories = [
  Item_Categories(
    image:
        'https://i.pinimg.com/474x/25/77/cf/2577cf3562eb31e6326c024a7066259a.jpg',
    text: 'Bundles',
  ),
  Item_Categories(
    image:
        'https://i.pinimg.com/550x/df/c2/b4/dfc2b4965f7657f2bc9ec74acb11a6c7.jpg',
    text: 'Perfumes',
  ),
  Item_Categories(
    image: 'https://cdn.wconcept.com/products/7202026/08/720202608_1.jpg',
    text: 'Makeup',
  ),
  Item_Categories(
    image:
        'https://i.pinimg.com/736x/7f/57/77/7f5777d531d8fe417c5c3342fe5a2b33.jpg',
    text: 'Skin Care',
  ),
  Item_Categories(
    image:
        'https://i.pinimg.com/736x/5a/2a/51/5a2a518ec2620e980e24a0593b3d6754.jpg',
    text: 'Gifts',
  ),
];
