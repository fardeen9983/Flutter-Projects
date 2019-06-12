import 'package:flutter/material.dart';
import 'products.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop))),
        alignment: Alignment.center,
        child: RaisedButton(
          child: Text("LOGIN"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/");
          },
        ),
      ),
    );
  }
}
