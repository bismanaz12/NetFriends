class UserModel {
  String firstName;
  String uid;
  String lastName;
  List<dynamic> followers;
  String gender;
  List<dynamic> followings;
  String dob;
  String password;
  String email;
  String photoUrl;

  UserModel({
    required this.firstName,
    required this.uid,
    required this.lastName,
    required this.followers,
    required this.gender,
    required this.followings,
    required this.dob,
    required this.password,
    required this.email,
    required this.photoUrl
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      uid: json['uid'],
      lastName: json['lastName'],
      followers: json['followers'] ?? [],
      gender: json['gender'] ?? '',
      followings: json['followings'] ?? [],
      dob: json['dob'],
      password: json['password'],
      email: json['email'],
      photoUrl: json['photoUrl']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'uid': uid,
      'lastName': lastName,
      'followers': followers,
      'gender': gender,
      'followings': followings,
      'dob': dob,
      'password': password,
      'email': email,
      'photoUrl':photoUrl
    };
  }
}
