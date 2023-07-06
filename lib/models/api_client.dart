import 'package:flutter/material.dart';

import '../redux/selectors/selectors.dart';
import 'box_color.dart';
import 'dart:math';
import 'dart:convert';

class ColorException extends FormatException {
  final Color badColor;

  ColorException(String message, this.badColor) : super(message);
}

class ApiClient {
  static Future<MyBoxColor> getBoxColor() async {
    Random rng = new Random();

    // The data is JSON encoded only for demonstration
    // Random values are doubles in range [0, 10] with 0.1 step
    var json = jsonEncode({
      'red': (rng.nextDouble() * 101).floorToDouble() / 10,
      'green': (rng.nextDouble() * 101).floorToDouble() / 10,
      'blue': (rng.nextDouble() * 101).floorToDouble() / 10,
    });

    // Simulating async call
    await Future.delayed(Duration(milliseconds: 500));

    var color = jsonDecode(json);

    if (color['red'] < 1.0 || color['green'] < 1.0 || color['blue'] < 1.0) {
      throw ColorException(
        'This might not be a good color $color',
        colorSelector(MyBoxColor.fromJson(color)),
      );
    }

    // Creating an instance from decoded JSON
    return MyBoxColor.fromJson(color);
  }
}
