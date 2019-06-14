import 'package:easy_list/pages/auth.dart';
import 'package:easy_list/pages/product.dart';
import 'package:easy_list/pages/products.dart';
import 'package:easy_list/pages/products_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
    print(_products);
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => AuthPage(),
        "/products": (context) => ProductsPage(_products),
        "/admin": (context) => ProductsAdminPage(_addProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> path = settings.name.split('/');
        if (path[0] != '') {
          return null;
        }
        if (path[1] == "product") {
          final int index = int.parse(path[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  _products[index]["title"],
                  _products[index]["image"],
                  _products[index]["price"].toString(),
                  _products[index]["desc"]));
        }
        return null;
      },
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
