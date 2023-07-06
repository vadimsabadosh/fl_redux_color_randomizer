import 'dart:convert';

import 'package:meta/meta.dart';

import 'models.dart';

@immutable
class AppState {
  final MyBoxColor boxColor;

  const AppState({
    required this.boxColor,
  });

  dynamic toJson() => {
        'boxColor': boxColor,
      };

  @override
  String toString() {
    return 'MyBoxColor: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
