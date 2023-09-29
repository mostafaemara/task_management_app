class User {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;

  User(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.photoUrl});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
    );
  }
}
