import 'package:flutter/material.dart';

class Gradient_BG extends StatelessWidget {
  Widget child;

  Gradient_BG({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF33B6FF),
                Colors.white
              ]
          )
      ),
      child: child,
    );
  }
}
