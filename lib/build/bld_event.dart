
import 'package:flutter/material.dart';

Widget buildEventTab() {
    // You can use a similar FutureBuilder pattern for events as well if needed
    return const Center(
      child: Text(
        "Events",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 25,
          color: Color(0xff191923),
        ),
      ),
    );
  }