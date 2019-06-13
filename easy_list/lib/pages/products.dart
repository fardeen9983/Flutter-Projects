import 'package:easy_list/widgets/products/products.dart';
import 'package:flutter/material.dart';



class ProductsPage extends StatefulWidget {
  final List<Map<String, dynamic>> _products;

  ProductsPage(this._products);
  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    bool acceptTerms = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          
          ),SizedBox(width: 8.0,)
        ],
      ),
      body: Column(
        children: <Widget>[
          SwitchListTile(
            value: acceptTerms,
            onChanged: (bool val) {
              setState(() {
                acceptTerms = val;
              });
            },
            title: Text("Accept Terms"),
          ),
          Expanded(
              child: Products(
            widget._products,
          )),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose"),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Managed Products"),
              onTap: () => Navigator.pushReplacementNamed(context, "/admin"),
            )
          ],
        ),
      ),
    );
  }
}
