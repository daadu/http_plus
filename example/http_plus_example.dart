import 'package:http_plus/http_plus.dart' as http;

void main() async {
  // This example fetches Google homepage.
  final url = Uri.https('google.com', '/');

  // Await the http get response.
  final response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response headers: ${response.headers}');
  print('Response body: ${response.body}');

  // Close all connections when not required.
  http.closeAllConnections();
}
