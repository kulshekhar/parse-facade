// Copyright (c) 2016, kulshekhar. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:parse_facade/parse_facade.dart';

main() async {
  // Initialize your parse app
  Parse.initialize('applicationId', 'javascriptKey');
  // set the URL of parse-server
  Parse.serverURL = 'http://localhost:1337/parse';

  // Object declaration
  var p1 = new ParseObject('Person');
  p1.set('address', 'some place');
  await p1.save();
  // you can also save an object with additional attributes
  await p1.save(attributes: {'someNum': 100});

  // alternative object declaration
  var p2 = new ParseObject('Person', {'address': 'some place'});
  await p2.save();

  // Signing up a user using the static method
  await ParseUser.signUpUser('username', 'password');
  // Signing up a user with attributes using the static method
  await ParseUser.signUpUser('username', 'password', {'address': 'some place'});

  // Signup a user from a User instance
  var u1 = new ParseUser()
    ..username = 'user1'
    ..password = 'password1';
  await u1.signUp();
}
