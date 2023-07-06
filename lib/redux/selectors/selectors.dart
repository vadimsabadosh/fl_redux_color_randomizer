import 'package:flutter/material.dart';

import '../../models/box_color.dart';

colorSelector(MyBoxColor boxColor) {
  return Color.fromRGBO((boxColor.red * 25.5).round(),
      (boxColor.green * 25.5).round(), (boxColor.blue * 25.5).round(), 1);
}
