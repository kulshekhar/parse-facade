// Copyright (c) 2016, kulshekhar. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
@TestOn('browser')
import 'package:test/test.dart';
import 'package:xhr_interceptor_facade/xhr_interceptor_facade.dart';

import 'util/sdk_loader.dart';
import 'groups/static.dart';
import 'groups/object.dart';
import 'groups/user.dart';

main() async {
  var scriptLoader = new ScriptLoader();
  await scriptLoader.loadSDK();
  await scriptLoader.loadInterceptor();
  var xi = new XHRInterceptor();

  testStatic();
  testObject(xi);
  testUser(xi);
}
