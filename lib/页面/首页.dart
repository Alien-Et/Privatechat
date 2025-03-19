import 'package:flutter/material.dart';
import '聊天页面.dart';
import '../组件/好友项.dart';
import '../模型/好友.dart';

class 首页 extends StatefulWidget {
  const 首页({super.key});

  @override
  _首页状态 createState() => _首页状态();
}

class _首页状态 extends State<首页> {
  final _页面控制器 = PageController();
  final List<好友> 好友列表 = List.generate(
    10,
    (index) => 好友(id: 'id$index', 名称: '好友 $index', 是否在线: index % 2 == 0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('去中心化聊天'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: 聊天搜索代理(好友列表)),
          ),
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () => _显示添加好友对话框(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('最近聊天', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 16),
                Text('好友列表'),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _页面控制器,
              children: [
                _构建聊天列表(),
                _构建好友列表(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _构建聊天列表() {
    return ListView.builder(
      itemCount: 好友列表.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: 好友列表[index].是否在线 ? Colors.green : Colors.grey,
        ),
        title: Text(好友列表[index].名称),
        subtitle: const Text('最后一条消息'),
        trailing: const Text('10:00'),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => 聊天页面(好友: 好友列表[index])),
        ),
      ),
    );
  }

  Widget _构建好友列表() {
    return ListView.builder(
      itemCount: 好友列表.length,
      itemBuilder: (context, index) => 好友项(好友: 好友列表[index]),
    );
  }

  void _显示添加好友对话框(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加好友'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => print('扫描在线对等点'),
              child: const Text('扫描在线对等点'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: '输入好友ID'),
              onSubmitted: (id) => print('添加ID: $id'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
        ],
      ),
    );
  }
}

class 聊天搜索代理 extends SearchDelegate {
  final List<好友> 好友列表;

  聊天搜索代理(this.好友列表);

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => _构建搜索结果();

  @override
  Widget buildSuggestions(BuildContext context) => _构建搜索结果();

  Widget _构建搜索结果() {
    final results = 好友列表.where((friend) => friend.名称.contains(query)).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => 好友项(好友: results[index]),
    );
  }
}
