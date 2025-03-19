import 'package:flutter/material.dart';
import '../模型/消息.dart';

class 消息气泡 extends StatelessWidget {
  final 消息 消息;

  const 消息气泡({super.key, required this.消息});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: 消息.是否自己 ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: 消息.是否自己 ? Theme.of(context).primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          消息.内容,
          style: TextStyle(color: 消息.是否自己 ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
