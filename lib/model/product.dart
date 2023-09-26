import 'package:flutter/material.dart';

class Product{
    String? name;
    String? desc;
    double? price;
    IconData? picon;
    Product({this.name,this.desc,this.price,this.picon});

    Map<String,dynamic>toMap(){
      return{
        'name':name,
        'desc':desc,
        'price':price,
        

      };

    }
}