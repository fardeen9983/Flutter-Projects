import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final String address;

  const AddressTile({Key key, @required this.address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(4.0)),
      child: Text(address),
    );
  }
}
