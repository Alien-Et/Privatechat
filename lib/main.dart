import 'package:flutter/material.dart';
import '页面/首页.dart';

void main() {
  runApp(const 去中心化聊天应用());
}

class 去中心化聊天应用 extends StatelessWidget {
  const 去中心化聊天应用({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '去中心化聊天',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[200],
        primaryColor: Colors.blue[600],
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black87)),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[800],
        primaryColor: Colors.green[400],
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white70)),
      ),
      themeMode: ThemeMode.system,
      home: const 首页(),
    );
  }
}
