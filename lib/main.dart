import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'models/app_state.dart';
import 'models/box_color.dart';
import 'redux/reducers/app_reducer.dart';
import 'widgets/color_box.dart';
import 'widgets/color_controller.dart';
import 'widgets/randomizer.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState:
        AppState(boxColor: MyBoxColor(red: 5.0, green: 5.0, blue: 5.0)),
    middleware: [new LoggingMiddleware.printer(), thunkMiddleware],
  );
  print(store.state);
  runApp(StoreProvider(
    store: store,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redux Color Randomizer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Redux Color Randomizer'),
        ),
        // Connect to the store
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Text('Color Controller'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ColorController(),
                          ),
                        ),
                        ColorBox(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Wrapped the text in a row with the randomizer widget
                        Text('Color Controller'),
                        Randomizer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
