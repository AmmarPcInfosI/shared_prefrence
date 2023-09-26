
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence/model/product.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key,required this.products});
  List<Product>products=[];

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    
    _getData();
    // TODO: implement initState
    super.initState();
  }
  List<Product>productCart=[];
  _getData()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    for(var element in widget.products){
      if(prefs.containsKey(element.name!)){
        productCart.add(element);
      }
    }
    setState(() {
      
    });
    
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(title: const Text('Cart'),),
      body: ListView.builder(
        itemCount: productCart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(productCart[index].picon),
            title: Text(productCart[index].name!),
            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productCart[index].desc!),
                Text('Price: \$ ${productCart[index].price}')
              ],
            ),
            trailing:IconButton(onPressed: ()async{
              SharedPreferences prefs=await SharedPreferences.getInstance();
              prefs.remove(productCart[index].name!);
              productCart.remove(productCart[index]);
              setState(() {
                
              });
            }, icon: const Icon(Icons.remove_circle_sharp)) ,

          );
        },
      ),
    );
  }
}