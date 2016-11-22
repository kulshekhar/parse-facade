import 'dart:async';

import 'dart:js';

import 'parse_js.dart';
import 'utils.dart';

class ParseObject {
  ParseObject$ _po;

  /// Creates a new model with defined [attributes].
  ///
  ///     var object = new ParseObject("ClassName", {"f1": 123});
  ///
  ParseObject(String className, [Map<String, dynamic> attributes]) {
    if (attributes != null) {
      _po = new ParseObject$.fromMap(className, attributes);
    } else {
      _po = new ParseObject$(className);
    }
  }

  /// The ID of this object, unique within its class.
  String get id => _po.id;

  /// The name of the class this object belongs to.
  String get className => _po.className;

  /// The first time this object was saved on the server.
  DateTime get createdAt => _po.createdAt;

  /// The last time this object was updated on the server.
  DateTime get updatedAt => _po.updatedAt;

  /// Gets the value of an attribute.
  dynamic get(String key) => _po.get(key);

  /// Sets a [key] with the [value]
  void set(String key, dynamic value) => setMap({key: value});

  /// Sets all the key-value pairs from [map] in the object
  void setMap(Map<String, dynamic> map) {
    _po.set(new JsObject.jsify(map));
  }

  /// Set a hash of model [attributes] (if set) in addition to the other values
  /// that might have been set on the object, and save the model to the server.
  ///  `updatedAt` for the object will be updated when the request returns.
  ///
  Future<dynamic> save(
      {Map<String, dynamic> attributes,
      bool useMasterKey,
      String sessionToken}) async {
    //
    var completer = new Completer();

    final options = new JsObject.jsify({
      'useMasterKey': useMasterKey,
      'sessionToken': sessionToken,
      'success': allowInterop(createSuccessCB(completer)),
      'error': allowInterop(createErrorCB(completer))
    });

    if (attributes == null) {
      _po.save(null, options);
    } else {
      _po.save(new JsObject.jsify(attributes), options);
    }

    return completer.future;
  }
}
