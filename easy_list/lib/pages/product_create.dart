import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  const ProductCreatePage({Key key, this.addProduct}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreatePage> {
  TextEditingController title, desc, price;
  @override
  void initState() {
    title = TextEditingController();
    desc = TextEditingController();
    price = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: title,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Description"),
                controller: desc,
                maxLines: 6,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Price"),
                controller: price,
                keyboardType: TextInputType.number,
              ),
              SizedBox( 
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text("Create"),
                onPressed: () {
                  String title = this.title.text;
                  String desc = this.desc.text;
                  double price = double.parse(this.price.text);
                  widget.addProduct({
                    'title': title,
                    'desc': desc,
                    'image': 'assets/food.jpg',
                    'price': price
                  });
                  Navigator.pushNamed(context, "/");
                },
              )
            ],
          ),
        ));
  }
}
