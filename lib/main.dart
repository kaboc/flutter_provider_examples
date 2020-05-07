import 'package:flutter/material.dart';
import './pages/list.dart';

void main() => runApp(
      MaterialApp(
        home: ListPage(),
        title: 'provider examples',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 48.0),
          ),
        ),
      ),
    );
