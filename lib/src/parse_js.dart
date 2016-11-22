@JS()
library parse_js;

import 'dart:js';
import 'package:js/js.dart';

@JS('Parse')
class Parse$ {
  external static void initialize(String applicationId, String javaScriptKey,
      [String masterKey]);

  external static String get applicationId;
  external static String get javaScriptKey;

  external static String get serverURL;
  external static set serverURL(String);
}

@JS('Parse.Object')
class ParseObject$ {
  external ParseObject$(String className);

  factory ParseObject$.fromMap(
      String className, Map<dynamic, dynamic> attributes) {
    var po = new ParseObject$(className);
    po.set(new JsObject.jsify(attributes));
    return po;
  }

  external String get id;
  external String get className;
  external DateTime get createdAt;
  external DateTime get updatedAt;

  external dynamic get(String key);
  external dynamic set(JsObject map, [JsObject options]);

  external dynamic save([JsObject attrs, JsObject options]);
}

@JS('Parse.User')
class ParseUser$ {
  external ParseUser$();

  external static dynamic current();

  external String get id;
  external String get className;
  external DateTime get createdAt;
  external DateTime get updatedAt;

  external dynamic get(String key);
  external dynamic set(JsObject map, [JsObject options]);

  external String getUsername();
  external String getEmail();
  external String getSessionToken();

  @JS('logIn')
  external static dynamic logInUser(
      String username, String password, JsObject options);

  external dynamic logIn(JsObject options);

  @JS('signUp')
  external static dynamic signUpUser(
      String username, String password, JsObject attrs, JsObject options);

  external dynamic signUp(JsObject attrs, JsObject options);

  external static dynamic logOut();
}
