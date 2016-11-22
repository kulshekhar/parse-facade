import 'dart:js';
import 'package:test/test.dart';
import 'package:xhr_interceptor_facade/xhr_interceptor_facade.dart';

import 'package:parse_facade/parse_facade.dart';

import 'util/sdk_loader.dart';
import 'util/store_global.dart';

main() async {
  var scriptLoader = new ScriptLoader();
  if (context['Parse'] == null) {
    await scriptLoader.loadSDK();
  }
  if (context['XHRInterceptor'] == null) {
    await scriptLoader.loadInterceptor();
  }
  createGlobalStore();

  group('Parse Object', () {
    ParseObject o;
    XHRInterceptor xi;

    setUp(() {
      Parse.initialize('appId', 'jsKey');
      Parse.serverURL = 'http://www.example.com';
      o = new ParseObject('MyClass');

      xi = new XHRInterceptor();
    });

    test('is instantiated using just the class name', () {
      expect(o.className, equals(('MyClass')));
    });

    test('is instantiated using class name and attributes', () {
      o = new ParseObject('MyClass', {'name': 'my name'});
      expect(o.get('name'), equals('my name'));
    });

    test('sets the value of an attribute properly', () {
      o.set('f1', 3);
      o.set('f2', 'aa');

      expect(o.get('f1'), equals(3));
      expect(o.get('f2'), equals('aa'));
      expect(o.get('f3'), isNull);
    });

    test('sets the values of attributes using a Map', () {
      o.setMap({'f2': 2, 'f3': 'dd'});

      expect(o.get('f2'), equals(2));
      expect(o.get('f3'), equals('dd'));
      expect(o.get('f1'), isNull);
    });

    test('invokes the API to save an object, without errors', () async {
      var attrs = {'f1': 1, 'f2': 'aa', 'f3': true};
      o.setMap(attrs);

      xi.matchAll([
        M('/classes/MyClass',
            {'f1': 1, 'f2': 'aa', 'f3': true, '_ApplicationId': 'appId'})
      ]);
      xi.intercept();

      try {
        var result = await o.save();

        expect(result.get('f1'), equals(1));
        expect(result.get('f2'), equals('aa'));
        expect(result.get('f3'), isTrue);
        expect(result.get('_ApplicationId'), equals('appId'));
      } catch (e) {
        if (e.runtimeType.toString() == "JSObjectImpl") {
          fail(e.message);
        } else {
          throw e;
        }
      }
    });

    test(
        'invokes the API to save an object with custom attributes, without errors',
        () async {
      var attrs = {'f1': 1, 'f2': 'aa', 'f3': true};
      o.setMap(attrs);

      var saveWithAttrs = {'f1': 4, 'f4': 'bb'};

      xi.matchAll([
        M('/classes/MyClass', {
          'f1': 4,
          'f2': 'aa',
          'f3': true,
          'f4': 'bb',
          '_ApplicationId': 'appId'
        })
      ]);
      xi.intercept();

      try {
        var result = await o.save(attributes: saveWithAttrs);

        expect(result.get('f1'), equals(4));
        expect(result.get('f2'), equals('aa'));
        expect(result.get('f3'), isTrue);
        expect(result.get('f4'), equals('bb'));
        expect(result.get('_ApplicationId'), equals('appId'));
      } catch (e) {
        if (e.runtimeType.toString() == "JSObjectImpl") {
          fail(e.message);
        } else {
          throw e;
        }
      }
    });

    tearDown(() {
      xi?.clear();
      xi?.restore();
    });
  });
}
