import 'package:flutter/material.dart';
import './pages/list.dart';

void main() => runApp(
      MaterialApp(
        home: ListPage(),
        theme: ThemeData(
          textTheme: const TextTheme(
            body1: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
    );
