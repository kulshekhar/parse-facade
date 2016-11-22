@JS()
library interceptor;

import 'dart:js';
import 'package:js/js.dart';

Matcher M(String expression, Map<String, dynamic> response,
        [int statusCode = 200]) =>
    new Matcher(expression, new JsObject.jsify(response), statusCode);

@JS()
class XHRInterceptor {
  external XHRInterceptor();

  external void match(Matcher matcher);
  external void matchAll(List<Matcher> matchers);
  external void intercept();
  external void restore();
  external void clear();
}

@JS()
class Matcher {
  external dynamic get expression;
  external dynamic get response;
  external int get statusCode;

  external Matcher(dynamic expression, dynamic response, int statusCode);
}
