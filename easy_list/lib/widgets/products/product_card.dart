import 'package:easy_list/widgets/products/price_tag.dart';
import 'package:easy_list/widgets/ui_elements/address_tile.dart';
import 'package:easy_list/widgets/ui_elements/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;
  const ProductCard({Key key, @required this.product, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          _buildTitlePriceRow(),
          AddressTile(
            address: "Union Square, San Fransico",
          ),
          _buildButtonBar(context)
        ],
      ),
    );
  }

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleText(text: product['title']),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(
            price: product['price'].toString(),
          )
        ],
      ),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          color: Theme.of(context).accentColor,
          icon: Icon(Icons.info),
          onPressed: () => Navigator.pushNamed<bool>(
              context, "/product/" + index.toString()),
        ),
        IconButton(
          color: Colors.red,
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        )
      ],
    );
  }
}
