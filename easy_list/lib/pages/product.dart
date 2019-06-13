import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/rendering.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageURL;
  final String price;
  final String desc;

  ProductPage(this.title, this.imageURL, this.price, this.desc);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(this.imageURL),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Union Square, San Fransisco",
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      '|',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    '\$' + price.toString(),
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  desc,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }

  void _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Are you sure"),
              content: Text("This action can not be undone"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  child: Text("Continue"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  },
                )
              ],
            ));
  }
}
