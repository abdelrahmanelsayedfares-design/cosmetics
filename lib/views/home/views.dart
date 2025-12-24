import 'package:cosmetics/views/home/pages/categories/view.dart';
import 'package:cosmetics/views/home/pages/my_cart.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:flutter/material.dart';
import '../../core/ui/app_images.dart';
import 'pages/home/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = [
    _Model(icon: 'home.svg', page: HomePage()),
    _Model(icon: 'categories.svg', page: CategoriesPage()),
    _Model(icon: 'my_cart.svg', page: MyCartPageView()),
    _Model(icon: 'profile.svg', page: ProfilePage()),
  ];

  int Current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 6,
              spreadRadius: 0,
              color: Color(0xff0000001A),
            ),
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 4,
              spreadRadius: 0,
              color: Color(0xff0000001A),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 13),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              Current = index;
            });
          },
          currentIndex: Current,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                image: list[index].icon,
                color: Current == index ? Color(0xffDA498C) : null,
              ),
              label: '',
            ),
          ),
        ),
      ),
      body: list[Current].page,
    );
  }
}

class _Model {
  final String icon;
  final Widget page;

  _Model({required this.page, required this.icon});
}
