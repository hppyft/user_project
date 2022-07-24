import 'package:user_project/friends/repository/friends_model.dart';

class FriendsModelList {
  final List<FriendsModel> friends;

  FriendsModelList({
    required this.friends,
  });

  FriendsModelList.fromMap(Map<String, dynamic> map) : friends = [] {
    var results = map['results'];
    for (var result in results){
      var objectName = result['name'];
      String name = '${objectName['first']} ${objectName['last']}';
      var picture = result['picture'];
      String avatarUrl = picture['thumbnail'];
      friends.add(FriendsModel(name: name, avatarUrl: avatarUrl));
    }
  }
}
