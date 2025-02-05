
// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  final String id;
  final String name;
  final String role;
  final String email;
  final String? photoUrl;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    this.photoUrl,
  });
}
