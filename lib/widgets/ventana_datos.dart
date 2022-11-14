import 'package:flutter/material.dart';

class Ventanas {
  Widget ventanaDato(BuildContext context, datos, widget) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(size.height * 0.01)),
          widget
        ],
      ),
    );
  }
}
