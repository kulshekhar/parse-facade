import 'dart:async';

import 'parse_error.dart';

Function createSuccessCB(Completer completer, [String logMessage]) =>
    (dynamic result) {
      if (logMessage != null) {
        print(logMessage);
      }
      completer.complete(result);
    };

Function createErrorCB(Completer completer, [String logMessage]) =>
    (dynamic result, ParseError error) {
      if (logMessage != null) {
        print(logMessage);
      }
      completer.completeError(error);
    };
