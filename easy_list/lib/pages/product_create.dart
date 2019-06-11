import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
          child: RaisedButton(
        child: Text("Save"),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Center(
                    child: Text("This is a modal"),
                  ));
        },
      )),
    );
  }
}
