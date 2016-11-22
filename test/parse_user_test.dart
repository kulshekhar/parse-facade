import 'dart:async';
import 'dart:js';

import 'package:xhr_interceptor_facade/xhr_interceptor_facade.dart';
import 'package:test/test.dart';

import 'package:parse_facade/parse_facade.dart';

import 'util/sdk_loader.dart';

main() async {
  var scriptLoader = new ScriptLoader();
  if (context['Parse'] == null) {
    await scriptLoader.loadSDK();
  }
  if (context['XHRInterceptor'] == null) {
    await scriptLoader.loadInterceptor();
  }

  group('Parse User', () {
    XHRInterceptor xi;

    setUp(() {
      Parse.initialize('appId', 'jsKey');
      Parse.serverURL = 'http://www.example.com';
      xi = new XHRInterceptor();
    });

    test('is instantiated as expected', () {
      var u = new ParseUser();
      expect(u.className, equals('_User'));
    });

    test('sets the value of an attribute properly', () {
      var u = new ParseUser();
      u.set('f1', 3);
      u.set('f2', 'aa');

      expect(u.get('f1'), equals(3));
      expect(u.get('f2'), equals('aa'));
      expect(u.get('f3'), isNull);
    });

    test('sets the values of attributes using a Map', () {
      var u = new ParseUser();
      u.setMap({'f2': 2, 'f3': 'dd'});

      expect(u.get('f2'), equals(2));
      expect(u.get('f3'), equals('dd'));
      expect(u.get('f1'), isNull);
    });

    test('invokes the API to sign a user, without errors', () async {
      xi
        ..matchAll([
          M('/users',
              {'username': 'u1', 'password': 'p1', '_ApplicationId': 'appId'})
        ])
        ..intercept();

      var u = new ParseUser()
        ..username = 'u1'
        ..password = 'p1';

      try {
        var result = await u.signUp();

        expect(result.get('_ApplicationId'), equals('appId'));
      } catch (e) {
        if (e.runtimeType.toString() == "JSObjectImpl") {
          fail(e.message);
        } else {
          throw e;
        }
      }
    });

    test('invokes the static API to sign a user, without errors', () async {
      xi
        ..matchAll([
          M('/users',
              {'username': 'u1', 'password': 'p1', '_ApplicationId': 'appId'})
        ])
        ..intercept();

      try {
        var result = await ParseUser.signUpUser('u1', 'p1');

        expect(result.get('_ApplicationId'), equals('appId'));
      } catch (e) {
        if (e.runtimeType.toString() == "JSObjectImpl") {
          fail(e.message);
        } else {
          throw e;
        }
      }
    });

    test('invokes the API to login, without errors', () async {
      xi
        ..matchAll([
          M('/login',
              {'username': 'u1', 'password': 'p1', '_ApplicationId': 'appId'})
        ])
        ..intercept();

      var u = new ParseUser()
        ..username = 'u1'
        ..password = 'p1';

      try {
        var result = await u.logIn();

        expect(result.get('_ApplicationId'), equals('appId'));
      } catch (e) {
        if (e.runtimeType.toString() == "JSObjectImpl") {
          fail(e.message);
        } else {
          throw e;
        }
      }
    });

    test('invokes the static API to login, without errors', () async {
      xi
        ..matchAll([
          M('/login',
              {'username': 'u1', 'password': 'p1', '_ApplicationId': 'appId'})
        ])
        ..intercept();

      try {
        var result = await ParseUser.logInUser('u1', 'p1');

        expect(result.get('_ApplicationId'), equals('appId'));
      } catch (e) {
        if (e.runtimeType.toString() == "JSObjectImpl") {
          fail(e.message);
        } else {
          throw e;
        }
      }
    });

    test('logs a user out', () async {
      await ParseUser.logOut();

      expect(ParseUser.current(), isNull);
    });

    tearDown(() {
      xi?.clear();
      xi?.restore();
    });
  });
}
