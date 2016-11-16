// Copyright (c) 2016, kulshekhar. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'parse_js.dart';

class Parse {
  /// Call this method first to set up your authentication tokens for Parse.
  static void initialize(String applicationId, String javaScriptKey,
      [String masterKey]) {
    Parse$.initialize(applicationId, javaScriptKey, masterKey);
  }

  /// Your Parse Application ID.
  static String get applicationId => Parse$.applicationId;

  /// Your Parse JavaScript Key.
  static String get javaScriptKey => Parse$.javaScriptKey;

  /// The URL at which parse-server is accessible
  static String get serverURL => Parse$.serverURL;

  /// Set the URL at which parse-server is accessible
  static set serverURL(String value) {
    Parse$.serverURL = value;
  }
}
