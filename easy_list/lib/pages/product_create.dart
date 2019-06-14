import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  const ProductCreatePage({Key key, this.addProduct}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreatePage> {
  String title, desc, price;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWith = MediaQuery.of(context).size.width;
    final double width = deviceWith > 550.0 ? 500 : deviceWith * 0.95;
    final double padding = deviceWith - width;

    return Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
            children: <Widget>[
              _buildTextFieldForm(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                textColor: Colors.white,
                child: Text("Create"),
                onPressed: _createProduct,
              )
            ],
          ),
        ));
  }

  Widget _buildTextFieldForm() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: "Title"),
          onSaved: (val) {
            setState(() {
              title = val;
            });
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Description"),
          onSaved: (val) {
            setState(() {
              desc = val;
            });
          },
          maxLines: 6,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Price"),
          onSaved: (val) {
            setState(() {
              price = val;
            });
          },
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  void _createProduct() {
    _formKey.currentState.save();
    double price = double.parse(this.price);
    widget.addProduct({
      'title': title,
      'desc': desc,
      'image': 'assets/food.jpg',
      'price': price
    });
    Navigator.pushNamed(context, "/products");
  }
}
