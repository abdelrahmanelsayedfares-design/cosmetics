import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';
import '../../../core/ui/list_view_cart.dart';
import '../../check_out.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOut()),
                );
              },
              icon: AppImage(image: 'shopping.svg'),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You have 4 products in your cart',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff434C6D8C).withValues(alpha: .55),
                ),
              ),
              SizedBox(height: 34),
              ListViewCart(),
            ],
          ),
        ),
      ),
    );
  }
}
