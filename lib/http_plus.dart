/// Library that provides HTTP Client that can speak HTTP/2.
library http_plus;

import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';

import 'src/client.dart';

export 'src/client.dart';

/// Sends an HTTP HEAD request with the given headers to the given URL.
///
/// This uses the shared [HttpPlusClient.defaultClient] instance for making HTTP
/// request.
///
/// For more fine-grained control over the client, create and use
/// [HttpPlusClient] directly.
Future<Response> head(Uri url, {Map<String, String>? headers}) =>
    HttpPlusClient.defaultClient.head(url, headers: headers);

/// Sends an HTTP GET request with the given headers to the given URL.
///
/// This uses the shared [HttpPlusClient.defaultClient] instance for making HTTP
/// requests.
///
/// For more fine-grained control over the client, create and use
/// [HttpPlusClient] directly.
Future<Response> get(Uri url, {Map<String, String>? headers}) =>
    HttpPlusClient.defaultClient.get(url, headers: headers);

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
/// This uses the shared [HttpPlusClient.defaultClient] instance for making HTTP
/// requests.
///
/// For more fine-grained control over the client, create and use
/// [HttpPlusClient] directly.
Future<Response> post(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    HttpPlusClient.defaultClient
        .post(url, headers: headers, body: body, encoding: encoding);

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
/// This uses the shared [HttpPlusClient.defaultClient] instance for making HTTP
/// requests.
///
/// For more fine-grained control over the client, create and use
/// [HttpPlusClient] directly.
Future<Response> put(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    HttpPlusClient.defaultClient
        .put(url, headers: headers, body: body, encoding: encoding);

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
/// This uses the shared [HttpPlusClient.defaultClient] instance for making HTTP
/// requests.
///
/// For more fine-grained control over the client, create and use
/// [HttpPlusClient] directly.
Future<Response> patch(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    HttpPlusClient.defaultClient
        .patch(url, headers: headers, body: body, encoding: encoding);

/// Sends an HTTP DELETE request with the given headers to the given URL.
///
/// This uses the shared [HttpPlusClient.defaultClient] instance for making HTTP
/// requests.
///
/// For more fine-grained control over the client, create and use
/// [HttpPlusClient] directly.
Future<Response> delete(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    HttpPlusClient.defaultClient
        .delete(url, headers: headers, body: body, encoding: encoding);

/// Sends an HTTP GET request with the given headers to the given URL and
/// returns a Future that completes to the body of the response as a [String].
///
/// The Future will emit a [ClientException] if the response doesn't have a
/// success status code.
///
/// This uses the shared [HttpPlusClient.defaultClient] instance for making HTTP
/// requests.
///
/// For more fine-grained control over the client, create and use
/// [HttpPlusClient] directly.
Future<String> read(Uri url, {Map<String, String>? headers}) =>
    HttpPlusClient.defaultClient.read(url, headers: headers);

/// Sends an HTTP GET request with the given headers to the given URL and
/// returns a Future that completes to the body of the response as a list of
/// bytes.
///
/// The Future will emit a [ClientException] if the response doesn't have a
/// success status code.
///
/// This uses the shared [HttpPlusClient.defaultClient] instance for making HTTP
/// requests.
///
/// For more fine-grained control over the client, create and use
/// [HttpPlusClient] directly.
Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) =>
    HttpPlusClient.defaultClient.readBytes(url, headers: headers);

/// Closes all live connection for the [HttpPlusClient.defaultClient].
void closeAllConnections() => HttpPlusClient.defaultClient.close();
