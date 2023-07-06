import '../../models/app_state.dart';
import 'color_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    boxColor: colorReducer(state.boxColor, action),
  );
}
