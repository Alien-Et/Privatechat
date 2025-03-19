class 好友 {
  final String id;
  final String 名称;
  final String 头像网址;
  final bool 是否在线;

  好友({
    required this.id,
    required this.名称,
    this.头像网址 = '',
    this.是否在线 = false,
  });
}
