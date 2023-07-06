import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/api_client.dart';
import '../models/app_state.dart';
import '../redux/actions/actions.dart';

class Randomizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return ElevatedButton(
          child: Text('Randomize'),
          onPressed: () {
            vm.randomize((ColorException e) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                    e.message,
                    style: TextStyle(color: e.badColor),
                  ),
                  actions: <Widget>[
                    OutlinedButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            });
          },
        );
      },
    );
  }
}

class _ViewModel {
  final Function(Function(ColorException)) randomize;

  _ViewModel({required this.randomize});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      randomize: (Function(ColorException) onError) async {
        Completer completer = Completer();
        store.dispatch(getBoxColor(completer));
        try {
          await completer.future;
        } on ColorException catch (e) {
          onError(e);
        }
      },
    );
  }
}
