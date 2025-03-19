import 'package:flutter/material.dart';
import '../模型/好友.dart';
import '../模型/消息.dart';
import '../组件/消息气泡.dart';

class 聊天页面 extends StatefulWidget {
  final 好友 好友;

  const 聊天页面({super.key, required this.好友});

  @override
  _聊天页面状态 createState() => _聊天页面状态();
}

class _聊天页面状态 extends State<聊天页面> {
  final _输入控制器 = TextEditingController();
  final List<消息> 消息列表 = List.generate(
    10,
    (index) => 消息(
      发送者ID: index % 2 == 0 ? 'me' : 'friend',
      内容: '消息 $index',
      时间戳: DateTime.now(),
      是否自己: index % 2 == 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.好友.名称),
            Text(
              '${widget.好友.是否在线 ? '在线' : '离线'} - IP: 203.0.113.1',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 消息列表.length,
              itemBuilder: (context, index) => 消息气泡(消息: 消息列表[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _输入控制器,
                    decoration: const InputDecoration(hintText: '输入消息', border: OutlineInputBorder()),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_输入控制器.text.isNotEmpty) {
                      setState(() {
                        消息列表.add(消息(
                          发送者ID: 'me',
                          内容: _输入控制器.text,
                          时间戳: DateTime.now(),
                          是否自己: true,
                        ));
                        _输入控制器.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
