import 'package:flutter/material.dart';

class ItemProfile{
  final String image;
  final String text;



  ItemProfile({required this.text,required this.image});
}


List<ItemProfile> itemProfil=[

  ItemProfile(text: 'Edit Info', image:'edit.svg' ),
  ItemProfile(text: 'Order History Order History', image:'time_order.svg' ),
  ItemProfile(text: 'Wallet', image:'wallet.svg' ),
  ItemProfile(text: 'Settings', image:'setting.svg' ),
  ItemProfile(text: 'Voucher ', image:'setting-2.svg' ),
];