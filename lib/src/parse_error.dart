@JS()
library parse_error;

import 'package:js/js.dart';

@JS('Parse.Error')
class ParseError {
  /// Parse error code
  external int get code;

  /// Parse error message
  external String get message;

  /// Constructs a new Parse.Error object with the given code and message.
  ///
  external ParseError(int code, String message);

  /// Error code indicating some error other than those enumerated here.
  ///
  external static int get OTHER_CAUSE;

  /// Error code indicating that something has gone wrong with the server.
  /// If you get this error code, it is Parse's fault. File an issue at
  /// https://github.com/ParsePlatform/parse-server/issues
  ///
  external static int get INTERNAL_SERVER_ERROR;

  /// Error code indicating the connection to the Parse servers failed.
  ///
  external static int get CONNECTION_FAILED;

  /// Error code indicating the specified object doesn't exist.
  ///
  external static int get OBJECT_NOT_FOUND;

  /// Error code indicating you tried to query with a datatype that doesn't
  /// support it, like exact matching an array or object.
  ///
  external static int get INVALID_QUERY;

  /// Error code indicating a missing or invalid classname. Classnames are
  /// case-sensitive. They must start with a letter, and a-zA-Z0-9_ are the
  /// only valid characters.
  ///
  external static int get INVALID_CLASS_NAME;

  /// Error code indicating an unspecified object id.
  ///
  external static int get MISSING_OBJECT_ID;

  /// Error code indicating an invalid key name. Keys are case-sensitive. They
  /// must start with a letter, and a-zA-Z0-9_ are the only valid characters.
  ///
  external static int get INVALID_KEY_NAME;

  /// Error code indicating a malformed pointer. You should not see this unless
  /// you have been mucking about changing internal Parse code.
  ///
  external static int get INVALID_POINTER;

  /// Error code indicating that badly formed JSON was received upstream. This
  /// either indicates you have done something unusual with modifying how
  /// things encode to JSON, or the network is failing badly.
  ///
  external static int get INVALID_JSON;

  /// Error code indicating that the feature you tried to access is only
  /// available internally for testing purposes.
  ///
  external static int get COMMAND_UNAVAILABLE;

  /// You must call Parse.initialize before using the Parse library.
  ///
  external static int get NOT_INITIALIZED;

  /// Error code indicating that a field was set to an inconsistent type.
  ///
  external static int get INCORRECT_TYPE;

  /// Error code indicating an invalid channel name. A channel name is either
  /// an empty string (the broadcast channel) or contains only a-zA-Z0-9_
  /// characters and starts with a letter.
  ///
  external static int get INVALID_CHANNEL_NAME;

  /// Error code indicating that push is misconfigured.
  ///
  external static int get PUSH_MISCONFIGURED;

  /// Error code indicating that the object is too large.
  ///
  external static int get OBJECT_TOO_LARGE;

  /// Error code indicating that the operation isn't allowed for clients.
  ///
  external static int get OPERATION_FORBIDDEN;

  /// Error code indicating the result was not found in the cache.
  ///
  external static int get CACHE_MISS;

  /// Error code indicating that an invalid key was used in a nested
  /// JSONObject.
  ///
  external static int get INVALID_NESTED_KEY;

  /// Error code indicating that an invalid filename was used for ParseFile.
  /// A valid file name contains only a-zA-Z0-9_. characters and is between 1
  /// and 128 characters.
  ///
  external static int get INVALID_FILE_NAME;

  /// Error code indicating an invalid ACL was provided.
  ///
  external static int get INVALID_ACL;

  /// Error code indicating that the request timed out on the server. Typically
  /// this indicates that the request is too expensive to run.
  ///
  external static int get TIMEOUT;

  /// Error code indicating that the email address was invalid.
  ///
  external static int get INVALID_EMAIL_ADDRESS;

  /// Error code indicating a missing content type.
  ///
  external static int get MISSING_CONTENT_TYPE;

  /// Error code indicating a missing content length.
  ///
  external static int get MISSING_CONTENT_LENGTH;

  /// Error code indicating an invalid content length.
  ///
  external static int get INVALID_CONTENT_LENGTH;

  /// Error code indicating a file that was too large.
  ///
  external static int get FILE_TOO_LARGE;

  /// Error code indicating an error saving a file.
  ///
  external static int get FILE_SAVE_ERROR;

  /// Error code indicating that a unique field was given a value that is
  /// already taken.
  ///
  external static int get DUPLICATE_VALUE;

  /// Error code indicating that a role's name is invalid.
  ///
  external static int get INVALID_ROLE_NAME;

  /// Error code indicating that an application quota was exceeded.  Upgrade to
  /// resolve.
  ///
  external static int get EXCEEDED_QUOTA;

  /// Error code indicating that a Cloud Code script failed.
  ///
  external static int get SCRIPT_FAILED;

  /// Error code indicating that a Cloud Code validation failed.
  ///
  external static int get VALIDATION_ERROR;

  /// Error code indicating that invalid image data was provided.
  ///
  external static int get INVALID_IMAGE_DATA;

  /// Error code indicating an unsaved file.
  ///
  external static int get UNSAVED_FILE_ERROR;

  /// Error code indicating an invalid push time.
  ///
  external static int get INVALID_PUSH_TIME_ERROR;

  /// Error code indicating an error deleting a file.
  ///
  external static int get FILE_DELETE_ERROR;

  /// Error code indicating that the application has exceeded its request
  /// limit.
  ///
  external static int get REQUEST_LIMIT_EXCEEDED;

  /// Error code indicating an invalid event name.
  ///
  external static int get INVALID_EVENT_NAME;

  /// Error code indicating that the username is missing or empty.
  ///
  external static int get USERNAME_MISSING;

  /// Error code indicating that the password is missing or empty.
  ///
  external static int get PASSWORD_MISSING;

  /// Error code indicating that the username has already been taken.
  ///
  external static int get USERNAME_TAKEN;

  /// Error code indicating that the email has already been taken.
  ///
  external static int get EMAIL_TAKEN;

  /// Error code indicating that the email is missing, but must be specified.
  ///
  external static int get EMAIL_MISSING;

  /// Error code indicating that a user with the specified email was not found.
  ///
  external static int get EMAIL_NOT_FOUND;

  /// Error code indicating that a user object without a valid session could
  /// not be altered.
  ///
  external static int get SESSION_MISSING;

  /// Error code indicating that a user can only be created through signup.
  ///
  external static int get MUST_CREATE_USER_THROUGH_SIGNUP;

  /// Error code indicating that an an account being linked is already linked
  /// to another user.
  ///
  external static int get ACCOUNT_ALREADY_LINKED;

  /// Error code indicating that the current session token is invalid.
  ///
  external static int get INVALID_SESSION_TOKEN;

  /// Error code indicating that a user cannot be linked to an account because
  /// that account's id could not be found.
  ///
  external static int get LINKED_ID_MISSING;

  /// Error code indicating that a user with a linked (e.g. Facebook) account
  /// has an invalid session.
  ///
  external static int get INVALID_LINKED_SESSION;

  /// Error code indicating that a service being linked (e.g. Facebook or
  /// Twitter) is unsupported.
  ///
  external static int get UNSUPPORTED_SERVICE;

  /// Error code indicating that there were multiple errors. Aggregate errors
  /// have an "errors" property, which is an array of error objects with more
  /// detail about each error that occurred.
  ///
  external static int get AGGREGATE_ERROR;

  /// Error code indicating the client was unable to read an input file.
  ///
  external static int get FILE_READ_ERROR;

  /// Error code indicating a real error code is unavailable because
  /// we had to use an XDomainRequest object to allow CORS requests in
  /// Internet Explorer, which strips the body from HTTP responses that have
  /// a non-2XX status code.
  ///
  external static int get X_DOMAIN_REQUEST;
}
