import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }
}

Future<void> postReq(User user) async {
  final url = Uri.parse('https://reqres.in/api/users');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(user.toJson()),
  );

  if (response.statusCode == 201) {
    log('Success! Server Response: ${response.body}');
  } else {
    log('Failed! Server Response: ${response.statusCode}');
  }
}
