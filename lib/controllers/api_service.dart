import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';

class APISevice extends StatefulWidget {
  const APISevice({super.key});

  Future<List> getData() async {
    var response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    List responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  State<APISevice> createState() => _APISeviceState();
}

class _APISeviceState extends State<APISevice> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
