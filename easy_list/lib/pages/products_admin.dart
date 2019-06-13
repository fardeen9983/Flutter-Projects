import 'package:easy_list/pages/product_create.dart';
import 'package:easy_list/pages/product_list.dart';
import 'package:flutter/material.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct, deleteProduct;

  const ProductsAdminPage(this.addProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Managed Products"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  child: Text("Create Product"),
                ),
                Tab(
                  icon: Icon(Icons.list),
                  child: Text("My Product"),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[ProductCreatePage(addProduct: addProduct,), ProductListPage()],
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text("Choose"),
                  automaticallyImplyLeading: false,
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text("All Products"),
                  onTap: () => Navigator.pushReplacementNamed(context, "/"),
                )
              ],
            ),
          ),
        ));
  }
}
