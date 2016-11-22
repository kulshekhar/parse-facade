import 'dart:async';
import 'dart:js';

import 'parse_promise.dart';
import 'parse_js.dart';
import 'utils.dart';

class ParseUser {
  ParseUser$ _pu;

  ParseUser() {
    _pu = new ParseUser$();
  }

  /// The name of the class this object belongs to.
  String get className => _pu.className;

  /// The username of this user
  set username(String username) => this.set('username', username);

  /// The username of this user
  String getUsername() => _pu.getUsername();

  /// The password of this user
  set password(String password) => this.set('password', password);

  /// The email of this user
  set email(String email) => this.set('email', email);

  /// The email of this user
  String getEmail() => _pu.getEmail();

  /// The session token of this user
  String getSessionToken() => _pu.getSessionToken();

  /// The ID of this object, unique within its class.
  String get id => _pu.id;

  /// The first time this object was saved on the server.
  DateTime get createdAt => _pu.createdAt;

  /// The last time this object was updated on the server.
  DateTime get updatedAt => _pu.updatedAt;

  /// Gets the value of an attribute.
  dynamic get(String key) => _pu.get(key);

  /// Sets a [key] with the [value]
  void set(String key, dynamic value) => setMap({key: value});

  /// Sets all the key-value pairs from [map] in the object
  void setMap(Map<String, dynamic> map) {
    _pu.set(new JsObject.jsify(map));
  }

  /// Retrieves the currently logged in ParseUser with a valid session, either
  /// from memory or localStorage, if necessary.
  ///
  static dynamic current() => ParseUser$.current();

  /// Logs in a user with a username (or email) and password. On success,
  /// this saves the session to disk, so you can retrieve the currently logged
  /// in user using current.
  ///
  static Future<dynamic> logInUser(String username, String password) {
    var completer = new Completer();

    final options = new JsObject.jsify({
      'success': allowInterop(createSuccessCB(completer)),
      'error': allowInterop(createErrorCB(completer))
    });

    ParseUser$.logInUser(username, password, options);

    return completer.future;
  }

  /// Logs in a Parse.User. On success, this saves the session to disk, so
  /// you can retrieve the currently logged in user using current.
  /// A username and password must be set before calling logIn.
  ///
  Future<dynamic> logIn() {
    var completer = new Completer();

    final options = new JsObject.jsify({
      'success': allowInterop(createSuccessCB(completer)),
      'error': allowInterop(createErrorCB(completer))
    });

    _pu.logIn(options);

    return completer.future;
  }

  /// Logs out the currently logged in user session. This will remove the
  /// session from disk, log out of linked services, and future calls to
  /// current will return null.
  ///
  static Future<bool> logOut() {
    var completer = new Completer<bool>();

    ParsePromise p = ParseUser$.logOut();
    p.then(allowInterop(([dynamic result, int httpStatusCode, dynamic xhr]) {
      completer.complete(true);
    }), allowInterop(completer.completeError)).fail(
        allowInterop(completer.completeError));

    return completer.future;
  }

  /// Signs up a new user with a username (or email) and password. This will
  /// create a new Parse.User on the server, and also persist the session in
  /// localStorage so that you can access the user using [current].
  ///
  static Future<dynamic> signUpUser(String username, String password,
      [Map<String, dynamic> attrs]) {
    var completer = new Completer();

    final options = new JsObject.jsify({
      'success': allowInterop(createSuccessCB(completer)),
      'error': allowInterop(createErrorCB(completer))
    });

    attrs = attrs ?? {};
    ParseUser$.signUpUser(
        username, password, new JsObject.jsify(attrs), options);

    return completer.future;
  }

  /// Signs up a new user. This will create a new Parse.User on the server, and also
  /// persist the session on disk so that you can access the user using
  /// [current].
  ///
  /// A username and password must be set before calling signUp.
  ///
  Future<dynamic> signUp([Map<String, dynamic> attrs]) {
    var completer = new Completer();

    final options = new JsObject.jsify({
      'success': allowInterop(createSuccessCB(completer)),
      'error': allowInterop(createErrorCB(completer))
    });

    attrs = attrs ?? {};
    _pu.signUp(new JsObject.jsify(attrs), options);

    return completer.future;
  }
}
