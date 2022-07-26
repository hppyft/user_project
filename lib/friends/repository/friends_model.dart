class FriendsModel {
  final String name;
  final String avatarUrl;

  FriendsModel({
    required this.name,
    required this.avatarUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendsModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          avatarUrl == other.avatarUrl;

  @override
  int get hashCode => name.hashCode ^ avatarUrl.hashCode;
}
