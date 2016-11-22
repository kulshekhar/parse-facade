import 'package:xhr_interceptor_facade/xhr_interceptor_facade.dart';
import 'package:test/test.dart';

import 'package:parse_facade/parse_facade.dart';

void testUser(XHRInterceptor xi) {
  group('Parse User', () {
    setUp(() async {
      Parse.initialize('appId', 'jsKey');
      Parse.serverURL = 'http://www.example.com';

      xi.clear();

      xi.match(M('/logout', {}));
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
          M('/users', {
            "createdAt": "2016-11-22T16:24:40.953Z",
            "objectId": "fGrPPvOYxT",
            "sessionToken": "r:fNuiMqyLV75lp23D9qkVPK0iL"
          })
        ])
        ..intercept();

      var u = new ParseUser()
        ..username = 'u1'
        ..password = 'p1';

      try {
        await ParseUser.logOut();
        expect(ParseUser.current(), isNull);

        var result = await u.signUp();

        expect(
            result.get('sessionToken'), equals('r:fNuiMqyLV75lp23D9qkVPK0iL'));

        expect(ParseUser.current(), isNotNull);
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
          M('/users', {
            "createdAt": "2016-11-22T16:24:40.953Z",
            "objectId": "fGrPPvOYxT",
            "sessionToken": "r:fNuiMqyLV75lp23D9qkVPK0iL"
          })
        ])
        ..intercept();

      try {
        await ParseUser.logOut();
        expect(ParseUser.current(), isNull);

        var result = await ParseUser.signUpUser('u1', 'p1');

        expect(
            result.get('sessionToken'), equals('r:fNuiMqyLV75lp23D9qkVPK0iL'));

        expect(ParseUser.current(), isNotNull);
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
          M('/login', {
            "createdAt": "2015-12-18T13:41:51.217Z",
            "objectId": "nq3MUPQLBk",
            "sessionToken": "r:ZNGxuGCydK275ZeMlEDGDdSQj",
            "updatedAt": "2015-12-18T13:53:24.651Z",
            "username": "u1"
          })
        ])
        ..intercept();

      var u = new ParseUser()
        ..username = 'u1'
        ..password = 'p1';

      try {
        await ParseUser.logOut();
        expect(ParseUser.current(), isNull);

        var result = await u.logIn();

        expect(
            result.get('sessionToken'), equals('r:ZNGxuGCydK275ZeMlEDGDdSQj'));
        expect(ParseUser.current(), isNotNull);
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
          M('/login', {
            "createdAt": "2015-12-18T13:41:51.217Z",
            "objectId": "nq3MUPQLBk",
            "sessionToken": "r:ZNGxuGCydK275ZeMlEDGDdSQj",
            "updatedAt": "2015-12-18T13:53:24.651Z",
            "username": "u1"
          })
        ])
        ..intercept();

      try {
        await ParseUser.logOut();
        expect(ParseUser.current(), isNull);

        var result = await ParseUser.logInUser('u1', 'p1');

        expect(
            result.get('sessionToken'), equals('r:ZNGxuGCydK275ZeMlEDGDdSQj'));
        expect(ParseUser.current(), isNotNull);
      } catch (e) {
        if (e.runtimeType.toString() == "JSObjectImpl") {
          fail(e.message);
        } else {
          throw e;
        }
      }
    });

    test('logs a user out', () async {
      xi.intercept();

      await ParseUser.logOut();

      expect(ParseUser.current(), isNull);
    });

    tearDown(() async {
      xi?.restore();
    });
  });
}
