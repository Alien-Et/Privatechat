class 消息 {
  final String 发送者ID;
  final String 内容;
  final DateTime 时间戳;
  final bool 是否自己;

  消息({
    required this.发送者ID,
    required this.内容,
    required this.时间戳,
    required this.是否自己,
  });
}
