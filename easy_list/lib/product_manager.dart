import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
  final Function _addProduct, _deleteProduct;

  ProductManager(this._products,this._addProduct,this._deleteProduct);
  
  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(
            child: Products(
          _products,
          deleteProduct: this._deleteProduct,
        ))
      ],
    );
  }
}
