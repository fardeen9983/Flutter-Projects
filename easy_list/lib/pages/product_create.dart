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
  final Map<String, dynamic> _formData = {
    'title': null,
    'desc': null,
    'price': null,
    'image': 'assets/food.jpg'
  };
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
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
          )),
    );
  }

  Widget _buildTextFieldForm() {
    return Column(
      children: <Widget>[
        TextFormField(
          validator: (val) {
            if (val.isEmpty) return 'Title cannot be empty';
          },
          decoration: InputDecoration(labelText: "Title"),
          onSaved: (val) {
            _formData["title"] = val;
          },
        ),
        TextFormField(
          validator: (val) {
            if (val.isEmpty || val.length < 5)
              return 'Description is required and should be 5+ characters long';
          },
          decoration: InputDecoration(labelText: "Description"),
          onSaved: (val) {
            _formData["desc"] = val;
          },
          maxLines: 6,
        ),
        TextFormField(
          validator: (val) {
            if (val.isEmpty ||
                !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(val))
              return 'Price is required and should be a number';
          },
          decoration: InputDecoration(labelText: "Price"),
          onSaved: (val) {
            _formData["price"] = val;
          },
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  void _createProduct() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    double price = double.parse(this._formData["price"]);
    widget.addProduct({
      'title': _formData["title"],
      'desc': _formData["desc"],
      'image': _formData["image"],
      'price': price
    });
    Navigator.pushNamed(context, "/products");
  }
}
