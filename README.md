# parse_facade

parse_facade interfaces with Parse's [javascript SDK][parse-js-sdk] for working with [parse-server][parse-server]

## Usage

This package expects Parse's javascript SDK to be available in the browser.

Sample usage:

```dart
import 'package:parse_facade/parse_facade.dart';

main() {
  // Initialize your parse app
  Parse.initialize('applicationId', 'javascriptKey');
  // set the URL of parse-server
  Parse.serverURL = 'http://localhost:1337/parse';

  // Object declaration
  var p1 = new ParseObject('Person');
  p1.set('address', 'some place');
  await p1.save();
}
```

A slightly longer example can be found in the `example` folder.

## Features and bugs

This package is an attempt to allow the use of Parse's javascript SDK from dart in the browser. 

It tries to maintain the same API (to minimize the learning curve) while allowing  

That said, there will be some cases where the API is a bit different. This will mostly be done to remove ambiguity in method signatures. For example, the JS SDK can be used with callbacks or with promises (in most cases). However, this package uses only Futures and does away with callbacks altogether.

### Current state

This package currently doesn't expose all the functionality that the JS SDK does. However, the intention is to gradually make it feature compatible with the JS SDK.

## Contributing

Contributions in the form of suggestions to improve the code quality, feature requests, bug notifications, etc are all welcome.

If you have any suggestions/pull requests to improve this package, just open an issue and I'll be happy to work with you to improve this package.

You can file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/kulshekhar/parse-facade/issues
[parse-server]: https://github.com/ParsePlatform/parse-server
[parse-js-sdk]: https://github.com/ParsePlatform/Parse-SDK-JS