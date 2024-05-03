import 'package:jwt_decoder/jwt_decoder.dart';


int decodeToken(String token) {
  // Decode the token
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  // print(decodedToken);
  int id = decodedToken['user_id'];


  // print(id);

  return id;
}