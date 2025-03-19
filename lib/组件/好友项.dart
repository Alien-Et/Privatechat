import 'package:flutter/material.dart';
import '../模型/好友.dart';
import '../页面/聊天页面.dart';

class 好友项 extends StatelessWidget {
  final 好友 好友;

  const 好友项({super.key, required this.好友});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: 好友.是否在线 ? Colors.green : Colors.grey,
        child: 好友.头像网址.isEmpty ? Text(好友.名称[0]) : null,
        backgroundImage: 好友.头像网址.isNotEmpty ? NetworkImage(好友.头像网址) : null,
      ),
      title: Text(好友.名称),
      subtitle: Text(好友.是否在线 ? '在线' : '离线'),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => 聊天页面(好友: 好友)),
      ),
    );
  }
}
