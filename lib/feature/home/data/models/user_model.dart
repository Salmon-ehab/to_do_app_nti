class UserModel {
  String? name;
  String? image;
  String? accessToken;
  String? refreshToken;

  UserModel({this.name, this.image,this.accessToken,this.refreshToken});

    factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['username'],
      image: json['image_path'],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"]

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'access_token':accessToken,
      'refresh_token':refreshToken
    
    };
  }
}
