class ProfileModel {
  late final String name;
  late final String email;
  late final String avatarUrl;

  ProfileModel({
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  ProfileModel.fromMap(Map<String, dynamic> map) {
    var results = map['results'];
    var firstResult = results[0];

    var objectName = firstResult['name'];
    name = '${objectName['first']} ${objectName['last']}';

    email = firstResult['email'];

    var picture = firstResult['picture'];
    avatarUrl = picture['thumbnail'];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          avatarUrl == other.avatarUrl;

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ avatarUrl.hashCode;
}
