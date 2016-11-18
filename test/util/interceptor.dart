@JS()
library interceptor;

import 'dart:js';
import 'package:js/js.dart';

setUpInterceptor() {
  var xi = new XHRInterceptor();

  xi.matchAll([
    // M('/post/[0-9]+/[a-z]+', {'msg': 'good post'}, 200),
    // M('/g.*', {'msg': 'good get'})
  ]);
  xi.intercept();
}

Matcher M(String expression, Map<String, dynamic> response, [int statusCode]) =>
    new Matcher(expression, new JsObject.jsify(response), statusCode);

@JS()
class XHRInterceptor {
  external XHRInterceptor([String httpMockerURL]);

  external void match(Matcher matcher);
  external void matchAll(List<Matcher> matchers);
  external void intercept();
  external void restore();
}

@JS()
class Matcher {
  external dynamic get expression;
  external dynamic get response;
  external int get statusCode;

  external Matcher(dynamic expression, dynamic response,
      [int statusCode = 200]);
}
