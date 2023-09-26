import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence/model/product.dart';
import 'package:shared_prefrence/screens/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products=[
    Product(
      name: 'Shoes',
      picon: Icons.sports_basketball,
      price: 13.2,
      desc: 'Shoes with 42 size and red color'
    ),
    Product(
      name: 'Ball',
      picon: Icons.sports_football,
      price: 11.2,
      desc: 'Football to play'
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Products'),actions: [IconButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder:(context) => CartScreen(products: products),));
    }, icon: const Icon(Icons.shopping_bag_sharp))],),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(products[index].picon),
            title: Text(products[index].name!),
            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(products[index].desc!),
                Text('Price: \$ ${products[index].price}')
              ],
            ),
            trailing: IconButton(onPressed: ()async{
              SharedPreferences prefs=await SharedPreferences.getInstance();
              String data=jsonEncode(products[index].toMap());
              prefs.setString(products[index].name!, data);
            }, icon: const Icon(Icons.add_shopping_cart_sharp)),

          );
        },
      ),
    );
  }
}
