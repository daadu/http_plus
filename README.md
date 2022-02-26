# http_plus

<p>
<a href="https://pub.dev/packages/http_plus"><img src="https://img.shields.io/pub/v/http_plus?logo=dart" alt="pub.dev"></a>
<a href="https://github.com/daadu/http_plus/actions/workflows/ci.yml"><img src="https://github.com/daadu/http_plus/actions/workflows/ci.yml/badge.svg" alt="ci"></a>
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
<a href="#contributors-"><img src="https://img.shields.io/badge/all_contributors-1-orange.svg" alt="All Contributors" /></a>
<!-- ALL-CONTRIBUTORS-BADGE:END -->
<a href="https://pub.dev/packages/http_plus/score"><img src="https://badges.bar/http_plus/pub%20points" alt="pub points"></a>
<a href="https://pub.dev/packages/http_plus/score"><img src="https://badges.bar/http_plus/popularity" alt="popularity"></a>
<a href="https://pub.dev/packages/http_plus/score"><img src="https://badges.bar/http_plus/likes" alt="likes"></a>
<a href="https://github.com/daadu/http_plus/issues"><img src="https://img.shields.io/github/issues/daadu/http_plus?logo=github" alt="GitHub issues"></a>
<a href="https://github.com/daadu/http_plus/stargazers"><img src="https://img.shields.io/github/stars/daadu/http_plus?logo=github" alt="GitHub stars"></a>
<a href="https://github.com/daadu/http_plus/network"><img src="https://img.shields.io/github/forks/daadu/http_plus?logo=github" alt="GitHub forks"></a>
</p>

`http_plus` is a drop-in replacement for [`http`](https://pub.dev/packages/http) with `HTTP/2`
goodies! Under the hood, it wraps [http2](https://pub.dev/packages/http2) to make it compatible with
APIs of `http`. Additionally, it fallbacks to `HTTP/1.1` if H2 is not supported by the server.

> **CREDIT:** This is a fork of [`http2_client`](https://pub.dev/packages/http2_client) package, which is no longer maintained.

This package is in active development.
***Any contribution, idea, criticism or feedback is welcomed.***

## Quick links

|                   |                                                 |
| :---------------: | :----------------------------------------------:|
| **Package**       | https://pub.dev/packages/http_plus              |
| **API Docs**      | https://pub.dev/documentation/http_plus/latest/ |
| **Git Repo**      | https://github.com/daadu/http_plus              |
| **Issue Tracker** | https://github.com/daadu/http_plus/issues       |

## Using

The easiest way to use this library is via the top-level functions. They allow you to make
individual HTTP requests with minimal hassle:

```dart
import 'package:http_plus/http_plus.dart' as http;

void main() async {
  final url = Uri.https('example.com', '/whatsit/create');
  final body = {'name': 'doodle', 'color': 'blue'};
  // Await http post request
  final response = await http.post(url, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // Close all open connection - if not required
  http.closeAllConnections();
}
```

> For more detail on it check API docs of [top-level functions](https://pub.dev/documentation/http_plus/latest/http_plus/http_plus-library.html#functions).

Underneath it uses a default client with `maxOpenConnection` set as `8`, this client is re-used
among all top-level functions. If you want to have more fine-control over the client, then you can
define a custom `HttpPlusClient`:

```dart
import 'package:http_plus/http_plus.dart';

void main() async {
  final client = HttpPlusClient(
    enableHttp2: true,
    context: SecurityContext(withTrustedRoots: true),
    badCertificateCallback: (cert, host, port) => false,
    connectionTimeout: Duration(seconds: 15),
    autoUncompress: true,
    maintainOpenConnections: true,
    maxOpenConnections: -1,
    enableLogging: false,
  );

  final url = Uri.https('example.com', '/whatsit/create');
  final body = {'name': 'doodle', 'color': 'blue'};
  // Await http post request
  final response = await client.post(url, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // Close all open connection
  client.close();
}
```

> For more details on it check API docs of [`HttpPlusClient`](https://pub.dev/documentation/http_plus/latest/http_plus/HttpPlusClient-class.html).

## Todo

- Web platform support (use `BrowserClient` directly)
- Automatic testing
- Handle HTTP/2 server side push
- API for basic stats for each request - HTTP/2 vs 1.1, Connection Reuse vs New, etc
- Allow user to customize logic for connection re-cycling
- API to close connection to particular socket
- Live web demo

## Contribute

Check the [Todo](#todo) section above, before you begin with any contribution.

1. You'll need a GitHub account.
2. Fork the [repository](https://github.com/daadu/http_plus).
3. Pick an issue to work on from [issue tracker](https://github.com/daadu/http_plus/issues).
4. Implement it.
5. Add your name and email in `authors` section in `pubspec.yaml` file.
6. Send merge request.
7. Star this project.
8. Become a hero!!

## Features and bugs

Please file feature requests and bugs at
the [issue tracker](https://github.com/daadu/http_plus/issues).

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):
<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://bhikadia.com/"><img src="https://avatars.githubusercontent.com/u/4963236?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Harsh Bhikadia</b></sub></a><br /><a href="https://github.com/daadu/http_plus/commits?author=daadu" title="Code">💻</a> <a href="#ideas-daadu" title="Ideas, Planning, & Feedback">🤔</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors)
specification. Contributions of any kind welcome!