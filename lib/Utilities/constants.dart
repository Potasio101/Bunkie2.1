import 'package:flutter/material.dart';

// text style with color and font type
final kLabelStyle = TextStyle(
  color: Colors.blueGrey[800],
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

// box style template for a circle with color and radius mutators
final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFA5D6A7),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 4),
      ),
    ],
);