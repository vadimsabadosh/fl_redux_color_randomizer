import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../models/api_client.dart';
import '../../models/app_state.dart';
import '../../models/box_color.dart';

class SetColor {
  final MyBoxColor boxColor;

  SetColor(this.boxColor);
}

ThunkAction<AppState> getBoxColor(Completer completer) {
  return (Store<AppState> store) async {
    try {
      MyBoxColor boxColor = await ApiClient.getBoxColor();
      store.dispatch(SetColor(boxColor));
      completer.complete();
    } on ColorException catch (e) {
      completer.completeError(e);
    }
  };
}
