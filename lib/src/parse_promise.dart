@JS()
library parse_promise;

import 'package:js/js.dart';

typedef Promise PromiseCreator(Function resolve, [Function reject]);

@JS()
class Promise {
  external Promise(PromiseCreator);
  external Promise then(Function successCallback, [Function errorCallback]);

  // @JS('catch')
  // external Promise catchError(Function errorCallback);

  external static Promise reject(dynamic reason);
  external static Promise resolve(dynamic value);
  external static Promise all(List<Promise> promises);
  external static Promise race(List<Promise> promises);
}

@JS('Parse.Promise')
class ParsePromise {
  external static ParsePromise as(dynamic value);

  @JS('resolve')
  external static ParsePromise resolveIt(dynamic value);

  @JS('reject')
  external static ParsePromise rejectIt(dynamic error);
  external static ParsePromise error(dynamic error);
  external static ParsePromise when(List<ParsePromise> promises);
  external static ParsePromise all(List<ParsePromise> promises);
  external static ParsePromise race(List<ParsePromise> promises);

  external ParsePromise then(Function successCallback,
      [Function errorCallback]);

  external ParsePromise resolve(dynamic results);
  external ParsePromise reject(dynamic error);
  external ParsePromise done(Function callback);
  external ParsePromise fail(Function callback);
  external ParsePromise always(Function callback);
}
