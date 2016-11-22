import 'dart:js';

import 'package:test/test.dart';

import 'package:parse_facade/parse_facade.dart';

void testStatic() {
  group('Parse Initializer', () {
    JsObject nativeParse = context['Parse'];

    setUp(() {
      Parse.initialize('appId', 'jsKey');
      Parse.serverURL = 'http://localhost';
    });

    test('is initialized properly', () {
      expect(Parse.applicationId, equals('appId'));
      expect(nativeParse['applicationId'], equals(Parse.applicationId));

      expect(Parse.javaScriptKey, equals('jsKey'));
      expect(nativeParse['javaScriptKey'], equals(Parse.javaScriptKey));

      expect(Parse.serverURL, equals('http://localhost'));
      expect(nativeParse['serverURL'], equals(Parse.serverURL));
    });
  });
}
