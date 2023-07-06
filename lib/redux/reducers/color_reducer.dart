import 'package:redux/redux.dart';

import '../../models/box_color.dart';
import '../actions/actions.dart';

final colorReducer = TypedReducer<MyBoxColor, SetColor>(_setColorReducer);

MyBoxColor _setColorReducer(MyBoxColor state, SetColor action) {
  return action.boxColor;
}
