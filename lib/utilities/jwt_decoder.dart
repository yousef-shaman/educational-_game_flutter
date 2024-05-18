import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';


int decodeToken(String token) {
  // Decode the token
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  // print(decodedToken);
  int id = decodedToken['user_id'];


  // print(id);

  return id;
}

bool isTokenExpired(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid token');
  }
  final payload = json.decode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  final expiryDate = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
  return expiryDate.isBefore(DateTime.now());
}

