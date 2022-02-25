/// Library that provides HTTP Client that can speak HTTP/2.
library http_plus;

import 'dart:convert';

import 'package:http/http.dart';

import 'src/client.dart';

export 'src/client.dart';

final _client = HttpPlusClient(maxOpenConnections: 8);

/// Sends an HTTP HEAD request with the given headers to the given URL.
///
/// This uses a default [HttpPlusClient] object with
/// [HttpPlusClient.maxOpenConnections] set to 8. The object is shared across
/// all HTTP-method function provided. For more fine-grained control over the
/// client, use [HttpPlusClient] directly.
Future<Response> head(Uri url, {Map<String, String>? headers}) =>
    _client.head(url, headers: headers);

/// Sends an HTTP GET request with the given headers to the given URL.
///
/// This uses a default [HttpPlusClient] object with
/// [HttpPlusClient.maxOpenConnections] set to 8. The object is shared across
/// all HTTP-method function provided. For more fine-grained control over the
/// client, use [HttpPlusClient] directly.
Future<Response> get(Uri url, {Map<String, String>? headers}) =>
    _client.get(url, headers: headers);

/// Sends an HTTP POST request with the given headers and body to the given URL.
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
///
/// This uses a default [HttpPlusClient] object with
/// [HttpPlusClient.maxOpenConnections] set to 8. The object is shared across
/// all HTTP-method function provided. For more fine-grained control over the
/// client, use [HttpPlusClient] directly.
Future<Response> post(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _client.post(url, headers: headers, body: body, encoding: encoding);

/// Sends an HTTP PUT request with the given headers and body to the given URL.
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
///
/// This uses a default [HttpPlusClient] object with
/// [HttpPlusClient.maxOpenConnections] set to 8. The object is shared across
/// all HTTP-method function provided. For more fine-grained control over the
/// client, use [HttpPlusClient] directly.
Future<Response> put(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _client.put(url, headers: headers, body: body, encoding: encoding);

/// Sends an HTTP PATCH request with the given headers and body to the given
/// URL.
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
///
/// This uses a default [HttpPlusClient] object with
/// [HttpPlusClient.maxOpenConnections] set to 8. The object is shared across
/// all HTTP-method function provided. For more fine-grained control over the
/// client, use [HttpPlusClient] directly.
Future<Response> patch(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _client.patch(url, headers: headers, body: body, encoding: encoding);

/// Sends an HTTP DELETE request with the given headers to the given URL.
///
/// This uses a default [HttpPlusClient] object with
/// [HttpPlusClient.maxOpenConnections] set to 8. The object is shared across
/// all HTTP-method function provided. For more fine-grained control over the
/// client, use [HttpPlusClient] directly.
Future<Response> delete(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _client.delete(url, headers: headers, body: body, encoding: encoding);

/// Closes all live connection for the default [HttpPlusClient] client.
void closeAllConnections() => _client.close();
