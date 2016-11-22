@JS()
library store_global;

import 'dart:html';
import 'package:js/js.dart';

createGlobalStore() {
  ScriptElement s = new ScriptElement()
    ..text = r'''
    window.GlobalStore = {
      add: function(name, val) {
        window[name] = val;
      }
    };
    o = new Parse.Object('dd', {'name': 'sdfs'});
  ''';
  document.head.append(s);
}

@JS()
class GlobalStore {
  external static add(String name, dynamic val);
}
